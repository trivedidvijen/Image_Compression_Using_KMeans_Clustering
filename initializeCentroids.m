% initialize centroids for K-Means clustering
function initialCentroids = intializeCentroids(inputImage_RGB, noOfCentroids)
initialCentroids = zeros(noOfCentroids, size(inputImage_RGB, 2));

% choose random indices to initialize centroids
idx = randperm(size(inputImage_RGB,1), noOfCentroids);
initialCentroids = inputImage_RGB(idx, :);
end
