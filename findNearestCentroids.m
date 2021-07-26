% find nearest centroids for each row in the inputImage_RGB
function idx = findNearestCentroids(inputImage_RGB, centroids)
noOfCentroids = size(centroids, 1);

% initialize index to be returned eventually
idx = zeros(size(inputImage_RGB,1), 1);
for m=1:length(inputImage_RGB);
	distances = zeros(size(centroids, 1), 1);
	for c=1:noOfCentroids;
		distances(c) = sum((inputImage_RGB(m, :) - centroids(c, :)) .^ 2 );
	end
	[x, index] = min(distances);
	idx(m) = index;
end
end