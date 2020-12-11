%% --Create mask of cluster image--%%

function matlabbatch = CreateClusterMask(ClusterImages_files,matlabbatch)

    ClusterImages_resliced_files = {
        strcat('r',ClusterImages_files)
        };

matlabbatch{2}.spm.util.imcalc.input = ClusterImages_resliced_files;
matlabbatch{2}.spm.util.imcalc.output = strcat('Mask_',ClusterImages_resliced_files);
matlabbatch{2}.spm.util.imcalc.outdir = {''};
matlabbatch{2}.spm.util.imcalc.expression = 'i1>0.5';
matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{2}.spm.util.imcalc.options.mask = 0;
matlabbatch{2}.spm.util.imcalc.options.interp = 1;
matlabbatch{2}.spm.util.imcalc.options.dtype = 16;