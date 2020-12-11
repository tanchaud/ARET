%%%% ----- Cluster Overlap Task ----- %%%%
% by Tanusree Chaudhuri

%---------------------------------------------------------------------------------------------------------------%
<<<<<<< HEAD
% Documentation: Run this script to obtain proportion of brain
=======
% Documentation: Please run this script to obtain proportion of brain
>>>>>>> 7f084aa9c3531d1e62bb6377c70f54d58060e9c0
% regions detected in the cluster images. The output will appear in the 
% command window as the number of clusters detected 
% and the proportion (in percentage) of different brain regions present in that
% cluster. 
% 'CodeDir' contains the fullpath to the folder into which contents of
<<<<<<< HEAD
% remote repository ClusterFinal are copied. 
=======
% remote repository ClusterFinal are copied using the 'git clone <url of remote repo>' command in the terminal.
>>>>>>> 7f084aa9c3531d1e62bb6377c70f54d58060e9c0
% DataDir is the fullpath to the directory whose data needs to be analysed
% by this pipeline.
%---------------------------------------------------------------------------------------------------------------%

<<<<<<< HEAD
%clear all; clc;
global CodeDir;
global DataDir;
=======
clear all;clc;
>>>>>>> 7f084aa9c3531d1e62bb6377c70f54d58060e9c0
CodeDir = input('Enter fullpath to code directory: ');
addpath(genpath(CodeDir));
DataDir = input('Enter fullpath to the data directory: ');
cd(DataDir);
prefix = input('Enter prefix of images to be analysed: ');% For example, prefix = 'W_'
ImageFiles = dir(strcat(prefix,'*.*'));
for i = 1:length(ImageFiles)
    
    
    InputFilename = cellstr(strcat(ImageFiles(i).folder,'/',ImageFiles(i).name)); 
    Coregister(CodeDir,InputFilename);
    
    % Create mask of cluster image
    ImagesToBeMasked = extractfield(dir('rW_*.*'),'name');    
    InputFilename = cellstr(ImagesToBeMasked{1,i});
    OutputFilename = strcat('Mask_',ImagesToBeMasked{1,i});
    MaskingClusterImages(InputFilename,OutputFilename);
    
    % ------ Cluster Constituents.------ %%
    ClusterMask = niftiread(strcat('Mask_',ImagesToBeMasked{1,i}));
    CC = bwconncomp(ClusterMask);
    NumberOfClusters = CC.NumObjects;
    load TREE;
    for img_cluster = 1:NumberOfClusters
       combinedtxt = ClusterProportionInPercentages(CC,img_cluster,tree); 
       disp(combinedtxt)
    end
end

close all;













