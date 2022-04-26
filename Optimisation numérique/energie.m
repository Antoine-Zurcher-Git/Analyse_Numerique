function [val,grad] = energie(u)
L = 3/2;
h1 = 1;
h2 = 3/2;
val = h1+h2;
N = length(u)/2;
grad = zeros(2*N,1);
for i=N+1:2*N
    val = val+u(i);
    grad(i) = 1/(N+1);
end
val = val/(N+1);
end

