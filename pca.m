function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

% compute the cov matrix 'sigma'
% sigma = (1/m) * SumOver_i_1toM(Xi * Xi')
sigma = (1/m) * (X' * X);
% the matrix multiplication inherently handles the SumOver_i_1toM 
% X is [m x n], X' is [n x m], X'*X is [n x n] 
% hence sigma and U are both [n x n]

% compute the singular value decomposition on the covariance sigma to
% return the eigen vectors U and eigen values S (diagonal matrix of S values)
% both U and S are [n x n] matrices; where n -> features (columns) in X
[U,S] = svd(sigma);


% =========================================================================

end
