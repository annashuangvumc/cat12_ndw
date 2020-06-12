function cat12_main(varargin)

% This function example_main is the entry point to the matlab part of our
% spider. It takes a list of inputs, parses them, and calls the
% sub-functions for the various processing steps. We use matlab's varargin
% and inputParser methods to make this flexible and permit defaults for
% non-specified inputs.


%% Parse inputs

% Initialize the inputs structure
P = inputParser;

% Filepath for the T1 image. We will assume it's a compressed Nifti file,
% .nii.gz format. We'll use the default of '/INPUTS/T1.nii.gz' if this is
% not specified.
addOptional(P,'t1_niigz','/INPUTS/T1.nii.gz');
% addOptional(P,'t1_niigz','../INPUTS/HeckersPGPP-x-10025-x-10025-01-x-901.nii.gz')

% We need to know where to store our results. DAX/XNAT will look in a
% specific place to find them. Also, it's usually convenient to let this
% directory double as a working directory.
addOptional(P,'out_dir','/OUTPUTS');
addOptional(P,'skullstrip','3');

% It's useful to pass in the project, subject, session, scan information
% when running on XNAT so that we can show it on the spider report.
addOptional(P,'xnat_project','UNK_PROJ');
addOptional(P,'xnat_subject','UNK_SUBJ');
addOptional(P,'xnat_session','UNK_SESS');
addOptional(P,'xnat_scan_t1','UNK_SCAN_T1');

% Parse the inputs and store each in its own variable for easier
% readability. Then report them back, which is useful for debugging spider
% failures on XNAT.
parse(P,varargin{:});

t1_niigz   = P.Results.t1_niigz;
out_dir    = P.Results.out_dir;
skullstrip = P.Results.skullstrip;

xnat_project   = P.Results.xnat_project;
xnat_subject   = P.Results.xnat_subject;
xnat_session   = P.Results.xnat_session;
xnat_scan_t1   = P.Results.xnat_scan_t1;

fprintf('%s %s %s - T1 %s', ...
	xnat_project,xnat_subject,xnat_session, ...
	xnat_scan_t1);
fprintf('t1_niigz:   %s\n', t1_niigz   );
fprintf('out_dir:    %s\n', out_dir   );


%% Processing pipeline

% Prepare files. Nifti files are provided gzipped from XNAT, but SPM can
% only read unzipped ones. So it's useful to have an initial step that
% copies all the image files to a working directory and unzips them. In
% this case our working directory is also our output directory, and all new
% files that get created by the pipeline will therefore be there already
% without needing us to move them explicitly in the later steps.
[t1_nii] = cat12_prep_files(t1_niigz,out_dir);

% FMRI realignment. SPM will update the headers of the fmri_nii file in
% place, and will produce the mean fMRI and the text file of realignment
% parameters that we capture here.
cat12segmentation(t1_nii,out_dir,skullstrip);

% Make an output PDF. A PDF report is required for every spider that runs
% on XNAT.
% [pdf_file] = fullfile(out_dir,report,['catreport_' strrep(t1_nii,'.nii','.pdf')]);

%Zip output images. Also required by XNAT.
cat12_zip_outputs(out_dir,t1_nii)

%% Finally, exit.
% This step should only run when deployed (i.e. when we are running the
% compiled version). But then it's necessary, to keep the matlab process
% from hanging forever after processing is finished.
if isdeployed, exit, end
