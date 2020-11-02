function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% note -
% X is [m x n], idx is [m x 1]
% idx has 'm' rows and each row of idx (i.e. idx(i)) has a value between 1:K

for iter = 1:K

  % sel is a vector of indices where idx(i) == iter 
  sel = find(idx == iter);

  % compute the mean of X values assigned to each centroid from 1:K
  % e.g if 3 rows in X are assigned to centroid 'K', find the mean of those
  % three rows in X. This mean is now the new centroid and replaces 'K'
  if (~isempty(sel))
    centroids(iter,:) = mean(X(sel,:), 1);
  endif
  
endfor

% =============================================================

end

