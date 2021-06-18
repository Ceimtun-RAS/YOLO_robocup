%%% TrainingSet Pre-Processing %%%%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%% Pre-process
% Creates a image, boxlabel and combined datastores 
% from gTruth from the _Image Labeler App_

function [ObjectDetectionDatastore] = PreProcess(varargin)

defaultPath = 'data/imgs'; 

p = inputParser; 

addParameter(p,'Folder',defaultPath,@isstring);
addParameter(p,'NoInput', false ,@islogical);

parse(p,varargin{:});

imageDatastorePath = p.Results.Folder; 
NoInput = p.Results.NoInput; 

dataStore = imageDatastore(imageDatastorePath, 'FileExtensions', [".jpg", ".png"]);

save("data/dataStore", "dataStore"); 

msg = join([...
    "Do you want to label the images from dataStore in [",... 
    imageDatastorePath,...
    "]? [y/n]\n",...
    ]); 

if ~NoInput
    response = input(msg, 's'); 
end 

if ~NoInput&&(response == 'y'||response =='Y')
    disp("Opening Image Labeler..."); 
    imageLabeler(dataStore); 
    disp("Image Labeler Opened!"); 
end

if ~NoInput
    response = input("Load the Ground Truth Table? [y/n]\n", 's'); 
end 
if ~NoInput&&(response == 'n'||response == 'N')
    disp("Ending Preprocess...");  % Stop Script 
    return
end

%% Load the Ground Truth Value
try
    disp("Searching for Ground Truth Value..."); 
    load("data/dataset.mat", gTruth);  % import gTruth
catch ME
    msg = "There is no ground truth value to import. Please save it in data/datase.mat"; 
    causeException = MException('MATLAB:myCode:dimensions',msg);
    ME = addCause(ME,causeException);
    rethrow(ME); 
end 

% Create the dataset
[imds, blds] = objectDetectorTrainingData(gTruth); 
ObjectDetectionDatastore = combine(imds, blds);

disp("Preprocess Completed..."); 
end 