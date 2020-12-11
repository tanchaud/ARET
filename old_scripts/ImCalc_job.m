%-----------------------------------------------------------------------
% Job saved on 08-Feb-2019 16:47:13 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7487)
% cfg_basicio BasicIO - Unknown
% dtijobs DTI tools - Unknown
%-----------------------------------------------------------------------


matlabbatch{1}.spm.util.imcalc.input = {
    '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/rW_ABAPgtM_pu0_005_20.nii,1'
    '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/ANO_x10.nii,1'
    };
matlabbatch{1}.spm.util.imcalc.output = 'Cluster_rW_ABAPgtM_pu0_005_20';
% matlabbatch{1}.spm.util.imcalc.input = {
%     '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/rW_ABAPltM_pu0_005_20.nii,1'
%     '/home/tchaudhuri/code/matlab/Cluster_Overlap_Task/ANO_x10.nii,1'
%     };
% matlabbatch{1}.spm.util.imcalc.output = 'Cluster_rW_ABAPltM_pu0_005_20.nii';
matlabbatch{1}.spm.util.imcalc.outdir = {''};
matlabbatch{1}.spm.util.imcalc.expression = 'i2.*(i1>1)';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
