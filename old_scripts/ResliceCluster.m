%% --Reslice cluster image to match annotation image-- %%

function matlabbatch = ResliceCluster(ClusterImages)

%matlabbatch{1}.spm.spatial.coreg.write.ref = {strcat(TaskDir,'ANO_x10.nii,1')};
matlabbatch{1}.spm.spatial.coreg.write.ref = {'ANO_x10.nii,1'};
matlabbatch{1}.spm.spatial.coreg.write.source = ClusterImages;
matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';