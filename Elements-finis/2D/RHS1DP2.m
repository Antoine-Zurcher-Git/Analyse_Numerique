
function b2 = RHS1DP2(n,f0)
h = 1/(n+1);
b2 = zeros(2*n+1,1); 
for i=1:2*n+1
b2(i)=f0 * h / 3 * (1+mod(i,2)); % vecteur colonne
end
end