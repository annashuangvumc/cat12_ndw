#!/bin/sh

singularity \
run \
--cleanenv \
--home /home/anna/Documents/Spiders/cat12_spider/INPUTS \
--bind INPUTS:/INPUTS \
--bind OUTPUTS:/OUTPUTS \
cat12_singularity_v2.simg \
t1_niigz /INPUTS/A00018030_V2.nii.gz \
out_dir /OUTPUTS \
skullstrip 2 \
xnat_project TEST_PROJ \
xnat_subject TEST_SUBJ \
xnat_session TEST_SESS \
xnat_scan_t1 TEST_SCAN_T1




#singularity \
#exec \
#--cleanenv \
#--home /home/anna/Documents/cat12_spider/INPUTS \
#--bind INPUTS:/INPUTS \
#--bind OUTPUTS:/OUTPUTS \
#cat12_singularity_v1.simg \
#xvfb-run \
#bash /opt/cat12_spm/bin/run_spm12.sh \
#/usr/local/MATLAB/MATLAB_Runtime/v95 function cat12_main \
#t1_niigz /INPUTS/t1.nii.gz \
#out_dir /OUTPUTS \
#xnat_project TEST_PROJ \
#xnat_subject TEST_SUBJ \
#xnat_session TEST_SESS \
#xnat_scan_t1 TEST_SCAN_T1

