function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size (X,1);

distance = zeros(m,K);
tempX = X;

% centroid is usually initialised to some of the examples Xi
% basically a row in the centroid (i.e. each centroid example) 
% is comparable to a row in X i.e if X is [m x n] the centroid is [K x n]

for iter = 1:K
  % euclidean distance between two points (x,y) and (a,b) is root over 
  % (a-x)^2 + (b-y)^2
  % in this context, we are only comparing distances so root not required.

  % first we compute the difference between each row of X and 
  % the centroid at 'iter'.   
  tempX = bsxfun(@minus, X, centroids(iter,:));

  % Then square the difference. Then sum the squares in each row 
  % => giving the distance between each row in X and the centroid at 'iter'. 
  % This is then entered in column 'iter' in matrix 'distance'  
  tempX = tempX.^2;
  distance(:,iter) = sum(tempX, 2);

  % alternately above lines written in one line as below
  % distance(:,iter) = sum((bsxfun(@minus, X, centroids(iter,:))).^2, 2);
endfor

% for each row in distance, what is the index (i.e. column nr) of the 
% minimum value
[dummy,idx] = min(distance, [], 2);
% idx is [m x 1]; each idx(i) is an index number between 1:K
% so idx(i) == K, => X(i) is assigned to centroid 'K'
% i.e. X(i) is closest to centroid 'K'

% =============================================================
end

