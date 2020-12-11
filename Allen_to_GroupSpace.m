function Allen_to_GroupSpace(Templates)

% Description: Transformation of ANO file to group template space 
% -----------------------------------------%
% Tanusree Chaudhuri
% Max Planck Institute of Psychiatry, Munich
% tanusree_chaudhuri@psych.mpg.de
% -----------------------------------------%

% ----------------------------------------------------------------------------------------%
global DataDir;
global TemplatesDir;


% 1. Increase resolution of allen templates (TPMs,ANO) to match group template resolution% 
MC_change_voxel_size(Templates);

% 2. Register TPMs to group template (Template_6) %
matlabbatch{1}.spm.spatial.coreg.write.ref = cellstr(strcat(DataDir,'Template_6.nii,1'));
matlabbatch{1}.spm.spatial.coreg.write.source = cellstr(Templates);
matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';

spm_jobman('run',matlabbatch);

% Generate deformation fields (u_* files) %
Registered_Templates = {strcat(TemplatesDir,'r_b1grey.nii,1');strcat(TemplatesDir,'r_b2white.nii,1')};
matlabbatch{1}.spm.tools.dartel.warp1.images = cellstr(Registered_Templates);
matlabbatch{1}.spm.tools.dartel.warp1.settings.rform = 0;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(1).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(1).rparam = [4 2 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(1).K = 0;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(1).template = cellstr(strcat(DataDir,'Template_0.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(2).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(2).rparam = [2 1 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(2).K = 0;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(2).template = cellstr(strcat(DataDir,'Template_1.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(3).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(3).rparam = [1 0.5 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(3).K = 1;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(3).template = cellstr(strcat(DataDir,'Template_2.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(4).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(4).rparam = [0.5 0.25 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(4).K = 2;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(4).template = cellstr(strcat(DataDir,'Template_3.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(5).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(5).rparam = [0.25 0.125 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(5).K = 4;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(5).template = cellstr(strcat(DataDir,'Template_4.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(6).its = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(6).rparam = [0.25 0.125 1e-06];
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(6).K = 6;
matlabbatch{1}.spm.tools.dartel.warp1.settings.param(6).template = cellstr(strcat(DataDir,'Template_6.nii'));
matlabbatch{1}.spm.tools.dartel.warp1.settings.optim.lmreg = 0.01;
matlabbatch{1}.spm.tools.dartel.warp1.settings.optim.cyc = 3;
matlabbatch{1}.spm.tools.dartel.warp1.settings.optim.its = 3;

spm_jobman('run',matlabbatch);

% 3. Normalise registered TPMs & ANO to group template space % 
matlabbatch{1}.spm.tools.dartel.crt_warped.flowfields = cellstr(strcat(TemplatesDir,'u_r_b1grey.nii'));
TemplatesToWarp = {strcat(TemplatesDir,'r_b1grey.nii,1'); strcat(TemplatesDir,'r_b2white.nii,1');strcat(TemplatesDir,'ANO.nii')};
matlabbatch{1}.spm.tools.dartel.crt_warped.images = cellstr(TemplatesToWarp);
matlabbatch{1}.spm.tools.dartel.crt_warped.jactransf = 0;
matlabbatch{1}.spm.tools.dartel.crt_warped.K = 6;
matlabbatch{1}.spm.tools.dartel.crt_warped.interp = 0;

spm_jobman('run',matlabbatch);
