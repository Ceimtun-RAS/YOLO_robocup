clear; clc; close all; 

%% Import image 
img = imread('imgs/rgb.jpg'); % RGB image
I = imread('imgs/depth.jpg'); % Intensity images  1 Channel 

%% Axes Definition

[axes, ptsCloud] = getAxis(img, I);
mid_pts = midPointAxis(axes)
hold on; 

% Plot axis 
% scatter3(mid_pts(:, 1), mid_pts(:, 2),mid_pts(:, 3), 500, '.'); 

% collision boxes 

[N, val] = size(axes);
% collisionboxes = zeros(N, 1); 

pcshow(ptsCloud)
for i = 1:N
    collisionboxes(i) = CreateCollisionBoxFromAxis(axes(i, :))
    hold on; 
    [~,patchObj] = show(collisionboxes(i)); ;
    patchObj.EdgeColor= [0 1 0];
    patchObj.FaceColor = 'none';
    
end 
