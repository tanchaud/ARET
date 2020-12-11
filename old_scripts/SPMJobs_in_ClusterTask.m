%% SPM Jobs in Cluster Overlap Task 

% The task directory 'TaskDir' is the directory into which we pull the
% contents of the remote repository 'Cluster_Overlap_Task' using the 'git
% pull' command. 
% The data directory 'DataDir' is the directory containing the cluster images as nifti
% files,whose constituents need to be annotated and the proportion of the
% constituents need to be determined. 

% TaskDir = input('Enter fullpath to task directory: '); % For User
% 
% TaskDir = '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/';
% cd(TaskDir);
% DataDir = '';
% cd(DataDir);
% % --SPM Jobs-- %
% ClusterImages_files = {
%     'W_ABAPgtM_pu0_005_20.nii,1'
%     'W_ABAPltM_pu0_005_20.nii,1'
%     };
% for i = 1:length(ClusterImages_files)
% matlabbatch = ResliceCluster(ClusterImages_files{i,1},TaskDir);
% ClusterImages_resliced_files = {
%     strcat('r',ClusterImages_files{i,1}')
%     };
% matlabbatch = CreateClusterMask(ClusterImages_resliced_files,matlabbatch);
% spm('defaults', 'FMRI');
% spm_jobman('serial',matlabbatch);
% end

function ClusterMasks_files = SPMJobs_in_ClusterTask(ClusterImages_files)
addpath ~/toolboxes/spm12;
ClusterMasks_files = {};
% for i = 1:length(ClusterImages_files)
    matlabbatch = ResliceCluster(ClusterImages_files);

    matlabbatch = CreateClusterMask(ClusterImages_files,matlabbatch);
    spm('defaults', 'FMRI');
    spm_jobman('serial',matlabbatch);
    ClusterMasks_files{end + 1} = dir('Mask*.*');
% end

end