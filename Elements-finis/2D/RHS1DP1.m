%entrées
function b = RHS1DP1(n,f0)

h = 1/(n+1);

b = f0 * h * ones(n,1); % vecteur colonne
end