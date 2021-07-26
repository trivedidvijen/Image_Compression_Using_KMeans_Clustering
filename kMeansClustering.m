% Execute the K-Means clustering algorithm
function [centroids, idx] = kMeansClustering(inputImage_RGB, initialCentroids, maxIterations)
% Initialize values
[m n] = size(inputImage_RGB);
noOfCentroids = size(initialCentroids, 1);
centroids = initialCentroids;
idx = zeros(m, 1);

% Execute K-Means
for i=1:maxIterations
    % For each example in inputImage_RGB, assign the closest centroid
    idx = findNearestCentroids(inputImage_RGB, centroids);
    
    % Compute new centroids
    centroids = calculateCentroids(inputImage_RGB, idx, noOfCentroids);
end
end