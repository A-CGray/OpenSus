%% Setup.m
% Installs geom2d and 3d and adds OpenSus folders to path

%%
clc
disp('+-----------------------------------------------------+')
disp('+         INSTALLING OPENSUS DEPENDENCIES:            +')
disp('+-----------------------------------------------------+')
disp(' ')
%%
% If you don't have the geom2d and geom3d toolboxes installed we will need to do them first
fprintf('Checking for Geom2d: ')
if ~exist('isAxisHandle','file')
    disp('Geom2d toolbox not found')
    disp('Downloading Geom2d toolbox')
    websave('geom2d.mltbx','https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/7844/versions/27/download/mltbx');
    matlab.addons.toolbox.installToolbox('geom2d.mltbx');
    delete('geom2d.mltbx');
    disp('Geom2d toolbox installed!')
else
    fprintf('Found it!')
end

%%
disp(' ')
fprintf('Checking for Geom3d: ')
if ~exist('createLine3d','file')
    disp('Geom3d toolbox not found')
    disp('Downloading Geom3d toolbox')
    websave('geom3d.mltbx','https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/e564dff6-4a80-11e4-9553-005056977bd0/b0eccf7a-b5a7-4ba4-8d09-39644cf7fb38/packages/mltbx');
    disp('Installing Geom3d toolbox')
    matlab.addons.toolbox.installToolbox('geom3d.mltbx');
    delete('geom3d.mltbx');
    disp('Geom3d toolbox installed!')
else
    fprintf('Found it!')
end
disp(' ')
disp('ALL DEPENDENCIES INSTALLED')
disp(' ')
%%
disp('Adding OpenSus to Matlab path for current session')
disp(' ')
addpath(genpath('bin'));
disp('To add OpenSus to Matlab path permanently, use the `Set Path` tool under')
disp('the home tab and add the OpenSus bin folder and any subfolders')