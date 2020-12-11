function  MaskingClusterImages(InputFilename,OutputFilename)
    
    matlabbatch{1}.spm.util.imcalc.input = InputFilename;
    matlabbatch{1}.spm.util.imcalc.output = OutputFilename;
    matlabbatch{1}.spm.util.imcalc.outdir = {''};
    matlabbatch{1}.spm.util.imcalc.expression = 'i1>0.5';
    %matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{1}.spm.util.imcalc.options.mask = 0;
    matlabbatch{1}.spm.util.imcalc.options.interp = 1;
    matlabbatch{1}.spm.util.imcalc.options.dtype = 16;
    
    spm('defaults', 'FMRI');
    spm_jobman('serial',matlabbatch);
end