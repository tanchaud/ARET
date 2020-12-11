%-----------------------------------------------------------------------
% Job saved on 08-Feb-2019 16:40:21 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
% dtijobs DTI tools - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.coreg.write.ref = {'/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/ANO_x10.nii,1'};
matlabbatch{1}.spm.spatial.coreg.write.source = {
                                                 '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/W_ABAPgtM_pu0_005_20.nii,1'
                                                 '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/W_ABAPltM_pu0_005_20.nii,1'
                                                 };
matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';
