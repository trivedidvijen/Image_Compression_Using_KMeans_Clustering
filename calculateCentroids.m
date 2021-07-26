% calculate centroids
function centroids = calculateCentroids(inputImage_RGB, idx, noOfCentroids)
[m n] = size(inputImage_RGB);
centroids = zeros(noOfCentroids, n);
for i=1:noOfCentroids;
    % compute new centroid as mean of the data points in the input image labelled in idx
	centroids(i, :) = (1 / length(find(idx == i))) * sum(inputImage_RGB(find(idx == i), :));
end
end