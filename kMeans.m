clc;
clear all;
close all;

% read input image
inputImage = double(imread('onion.png'));

%normalize
inputImage = inputImage / 255;
inputImageSize = size(inputImage);

inputImage_RGB = reshape(inputImage, inputImageSize(1)*inputImageSize(2), 3);

noOfCentroids = 16;
maxIterations = 10;

% intialize centroids for K-Means
initialCentroids = initializeCentroids(inputImage_RGB, noOfCentroids)

[centroids, idx] = kMeansClustering(inputImage_RGB, initialCentroids, maxIterations);

% compressed image
inputImageCompressed_RGB = centroids(idx,:);
inputImageCompressed = reshape(inputImageCompressed_RGB, inputImageSize(1), inputImageSize(2), 3);

figure(1);
imshow(inputImage); 
title('Original');

figure(2);
imshow(inputImageCompressed);
title('Compressed');
imsave;