function MC_change_voxel_size(InputImages)
% script to change the voxel size of the selected image
% please adapt variable "voxsize"
%
% 11.9.2018
% M. Czisch
% T.Chaudhuri


voxsize = input('Enter desired voxel size: ');
% voxsize = [0.7 0.7 0.7]; % new voxel size {mm}

for i = 1:length(InputImages)
%V = spm_select([1 Inf],'image');
V = InputImages(i);
V = spm_vol(V{1,1});
V_data = spm_read_vols(V);
voxsize_orig = [V.mat(1,1) V.mat(2,2) V.mat(3,3)];
V.mat(1,1)=voxsize(1);V.mat(2,2)=voxsize(2);V.mat(3,3)=voxsize(3);
V.mat(1,4)=V.mat(1,4)*voxsize(1)/voxsize_orig(1);
% V.mat(2,4)=V.mat(2,4)*voxsize_orig(2)/voxsize(2);
% V.mat(3,4)=V.mat(3,4)*voxsize_orig(3)/voxsize(3);
V.mat(2,4)=V.mat(2,4)*voxsize(2)/voxsize_orig(2);
V.mat(3,4)=V.mat(3,4)*voxsize(3)/voxsize_orig(3);
spm_write_vol(V,V_data);
end
