# YOLO_robocup
YOLOv3 Matlab Implementation for Robocup challenge. 

## Objectives
* Design a YOLOv2 Architecture for Robocup 2021 Manipulator challenge, that recognizes bottles and cans in a simulated environment.
* Train the neural network for a robust prediction. 

## Preprocess Data
Multiple images were taken in the _Gazebo_ environment from the perspective. of the RGB-D Camera of the _Genova3 Robot Arm_. The input image is a 480x270x3 (RGB) 
resized to 270x270x3. A DataStore is created for the Labels and the Images , with the _Image Labeler Matlab App_


## YOLOv3 Implementation
Based on a SqueezeNet Feature extraction.


## Authors
CEIMTUN-RAS 2021 - Universidad Nacional de Colombia. 

