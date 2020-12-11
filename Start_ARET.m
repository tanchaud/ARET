%%% ------ START ARET ------ %%%%
% ------------------------------ %

% Description: start Allen ROI Extraction Toolbox to perform two
% functionalities - ROI Extraction and Cluster Labelling. 

% -----------------------------------------%
% Tanusree Chaudhuri
% Max Planck Institute of Psychiatry, Munich
% tanusree_chaudhuri@psych.mpg.de
% -----------------------------------------%

%% ----- Variables to be changed before running this script ----- %%%

global DataDir; 
DataDir = '/Users/tanchaud/Work/Data/Allen_ROI_extraction/Cluster_test';
global ToolboxDir;
ToolboxDir = '/Users/tanchaud/Work/Code/Allen_ROI_Extraction';

% ----------------------------------------------------------------- %

%% 

DataDir = strcat(DataDir,'/'); cd(DataDir);
ToolboxDir = strcat(ToolboxDir,'/');
global TemplatesDir;
TemplatesDir = strcat(ToolboxDir,'/','templates');
global ROI_ResultsDir;
mkdir(strcat(DataDir,'ROI_Results'));
ROI_ResultsDir = strcat(DataDir,'ROI_Results');


disp('Is transformation of templates to group space complete?');
answer = input('Enter Y for Yes and N for No: ');
switch answer
    case 'N'
        Templates = {strcat(TemplatesDir,'_b1grey.nii,1'); strcat(TemplatesDir,'_b2white.nii,1')};
        Allen_to_GroupSpace(Templates);
    case 'Y'
        
        % Toolbox Functionalities % 
        disp('Enter 1 as your choice of functionality for ROI Extraction and 2 for Cluster Labelling.');
        functionality = input('Enter your choice of functionality: ');
        switch functionality
            case 1
                brain_region = input('Enter name of brain region: ');
                [Int,mask] = annotation_tan(brain_region);
                
            case 2
                
                ImageFile = input('Enter filename of cluster image: ');
                ImageFile = strcat(DataDir,ImageFile);

                if (isfile(ImageFile) == 0)
                    msg = 'Image File does not exist';
                    error(msg)
                end
                [ClusterTable] = Cluster_Overlap_main(ImageFile);
                mkdir(strcat(DataDir,'ClusterLabelling_Results'));
                ClusterLabelling_ResultsDir = strcat(DataDir,'ClusterLabelling_Results');
                [pth,nam,ext] = spm_fileparts(ImageFile);
                save(strcat(ClusterLabelling_ResultsDir,'/CT_',nam),'ClusterTable');
                disp(['Cluster Labelling result is stored in ',ClusterLabelling_ResultsDir]);
        end
end