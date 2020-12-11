function Coregister(CodeDir,InputFilename)

    matlabbatch{1}.spm.spatial.coreg.write.ref = cellstr(strcat(CodeDir,'/templates/','ANO_x10.nii,1'));
    
    % matlabbatch{1}.spm.spatial.coreg.write.source = {
    %     strcat(DataDir,'W_ABAPgtM_pu0_005_20.nii,1')
    %     strcat(DataDir,'W_ABAPltM_pu0_005_20.nii,1')
    %     };
    matlabbatch{1}.spm.spatial.coreg.write.source = InputFilename;
    matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;
    matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
    matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
    matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';
    
    spm('defaults', 'FMRI');
    spm_jobman('serial',matlabbatch);
    
end