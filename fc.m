% Fix Cam already Use
close all; 
objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory
clc,clear all