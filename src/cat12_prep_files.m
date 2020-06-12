function [t1_nii] = cat12_prep_files(t1_niigz,out_dir)

[filepath,name,ext] = fileparts(t1_niigz);

copyfile(t1_niigz,fullfile(out_dir,[name '.gz']));
gunzip(fullfile(out_dir,[name '.gz']));
t1_nii = fullfile(out_dir,name);
