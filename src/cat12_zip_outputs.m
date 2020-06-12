function cat12_zip_outputs(out_dir,t1_nii)

[filepath,name,ext] = fileparts(t1_nii);

%% Segmentations

direc = [out_dir '/mri'];

gzip([direc filesep 'iy_' name '.nii']);
DEF_INV = [direc filesep 'iy_' name '.nii.gz'];
movefile(DEF_INV,out_dir)

gzip([direc filesep 'm' name '.nii']);
BIAS_CORR = [direc filesep 'm' name '.nii.gz'];
movefile(BIAS_CORR,out_dir)

gzip([direc filesep 'mwp1' name '.nii']);
MW_GRAY = [direc filesep 'mwp1' name '.nii.gz'];
movefile(MW_GRAY,out_dir)

gzip([direc filesep 'mwp2' name '.nii']);
MW_WHITE = [direc filesep 'mwp2' name '.nii.gz'];
movefile(MW_WHITE,out_dir)

gzip([direc filesep 'mwp3' name '.nii']);
MW_CSF = [direc filesep 'mwp3' name '.nii.gz'];
movefile(MW_CSF,out_dir)

gzip([direc filesep 'p0' name '.nii']);
ICV = [direc filesep 'p0' name '.nii.gz'];
movefile(ICV,out_dir)

gzip([direc filesep 'p1' name '.nii']);
GRAY = [direc filesep 'p1' name '.nii.gz'];
movefile(GRAY,out_dir)

gzip([direc filesep 'p2' name '.nii']);
WHITE = [direc filesep 'p2' name '.nii.gz'];
movefile(WHITE,out_dir)

gzip([direc filesep 'p3' name '.nii']);
CSF = [direc filesep 'p3' name '.nii.gz'];
movefile(CSF,out_dir)

gzip([direc filesep 'rm' name '_affine.nii']);
R_AFFINE = [direc filesep 'rm' name '_affine.nii.gz'];
movefile(R_AFFINE,out_dir)

gzip([direc filesep 'rp0' name '_affine.nii']);
R_ICV = [direc filesep 'rp0' name '_affine.nii.gz'];
movefile(R_ICV,out_dir)

gzip([direc filesep 'rp1' name '_affine.nii']);
R_GRAY = [direc filesep 'rp1' name '_affine.nii.gz'];
movefile(R_GRAY,out_dir)

gzip([direc filesep 'rp2' name '_affine.nii']);
R_WHITE = [direc filesep 'rp2' name '_affine.nii.gz'];
movefile(R_WHITE,out_dir)

gzip([direc filesep 'rp3' name '_affine.nii']);
R_CSF = [direc filesep 'rp3' name '_affine.nii.gz'];
movefile(R_CSF,out_dir)

gzip([direc filesep 'wj_' name '.nii']);
JACOBIAN = [direc filesep 'wj_' name '.nii.gz'];
movefile(JACOBIAN,out_dir)

gzip([direc filesep 'wm' name '.nii']);
WM = [direc filesep 'wm' name '.nii.gz'];
movefile(WM,out_dir)

gzip([direc filesep 'wp0' name '.nii']);
W_ICV = [direc filesep 'wp0' name '.nii.gz'];
movefile(W_ICV,out_dir)

gzip([direc filesep 'wp1' name '.nii']);
W_GRAY = [direc filesep 'wp1' name '.nii.gz'];
movefile(W_GRAY,out_dir)

gzip([direc filesep 'wp2' name '.nii']);
W_WHITE = [direc filesep 'wp2' name '.nii.gz'];
movefile(W_WHITE,out_dir)

gzip([direc filesep 'wp3' name '.nii']);
W_CSF = [direc filesep 'wp3' name '.nii.gz'];
movefile(W_CSF,out_dir)

gzip([direc filesep 'mi' name '.nii']);
MI = [direc filesep 'mi' name '.nii.gz'];
movefile(MI,out_dir)

gzip([direc filesep 'wmi' name '.nii']);
WMI = [direc filesep 'wmi' name '.nii.gz'];
movefile(WMI,out_dir)

gzip([direc filesep 'rmi' name '_affine.nii']);
RMI = [direc filesep 'rmi' name '_affine.nii.gz'];
movefile(RMI,out_dir)

gzip([direc filesep 'y_' name '.nii']);
DEF_FWD = [direc filesep 'y_' name '.nii.gz'];
movefile(DEF_FWD,out_dir)

%% surf
direc = [out_dir '/surf'];

gzip([direc filesep 'lh.central.' name '.gii']);
delete([direc filesep 'lh.central.' name '.gii']);

gzip([direc filesep 'lh.sphere.' name '.gii']);
delete([direc filesep 'lh.sphere.' name '.gii']);

gzip([direc filesep 'lh.sphere.reg.' name '.gii']);
delete([direc filesep 'lh.sphere.reg.' name '.gii']);

gzip([direc filesep 'lh.fractaldimension.' name]);
delete([direc filesep 'lh.fractaldimension.' name]);

gzip([direc filesep 'lh.gyrification.' name]);
delete([direc filesep 'lh.gyrification.' name]);

gzip([direc filesep 'lh.sqrtsulc.' name]);
delete([direc filesep 'lh.sqrtsulc.' name]);

gzip([direc filesep 'lh.thickness.' name]);
delete([direc filesep 'lh.thickness.' name]);

gzip([direc filesep 'rh.central.' name '.gii']);
delete([direc filesep 'rh.central.' name '.gii']);

gzip([direc filesep 'rh.sphere.' name '.gii']);
delete([direc filesep 'rh.sphere.' name '.gii']);

gzip([direc filesep 'rh.sphere.reg.' name '.gii']);
delete([direc filesep 'rh.sphere.reg.' name '.gii']);

gzip([direc filesep 'rh.fractaldimension.' name]);
delete([direc filesep 'rh.fractaldimension.' name]);

gzip([direc filesep 'rh.gyrification.' name]);
delete([direc filesep 'rh.gyrification.' name]);

gzip([direc filesep 'rh.sqrtsulc.' name]);
delete([direc filesep 'rh.sqrtsulc.' name]);

gzip([direc filesep 'rh.thickness.' name]);
delete([direc filesep 'rh.thickness.' name]);

gzip([direc filesep 's15.mesh.thickness.resampled.' name '.gii']);
delete([direc filesep 's15.mesh.thickness.resampled.' name '.gii']);

gzip([direc filesep 's20.mesh.fractaldimension.resampled.' name '.gii']);
delete([direc filesep 's20.mesh.fractaldimension.resampled.' name '.gii']);

gzip([direc filesep 's20.mesh.gyrification.resampled.' name '.gii']);
delete([direc filesep 's20.mesh.gyrification.resampled.' name '.gii']);

gzip([direc filesep 's20.mesh.sqrtsulc.resampled.' name '.gii']);
delete([direc filesep 's20.mesh.sqrtsulc.resampled.' name '.gii']);

%% movefiles

% reports
direc = [out_dir '/report'];
MAT = [direc filesep 'cat_' name '.mat'];
movefile(MAT,out_dir)

LOGTXT = [direc filesep 'catlog_' name '.txt'];
movefile(LOGTXT,out_dir)

PDF = [direc filesep 'catreport_' name '.pdf'];
movefile(PDF,out_dir)

REPORT = [direc filesep 'cat_' name '.xml'];
movefile(REPORT,out_dir)

% % labels
% direc = [out_dir '/label'];
% LABEL = [direc filesep 'catROI_' name '.mat'];
% movefile(LABEL,out_dir)
