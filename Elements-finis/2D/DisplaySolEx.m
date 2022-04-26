%plot et renvoit uexact
function uexact = DisplaySolEx(n,f, beta, epsilon)

h = 1/(n+1);
lesX = 0:h:1;
lesY = uexa(lesX,f,beta,epsilon);

uexact = lesY;

plot(lesX,lesY);


function [rep] = uexa(x,f,beta,epsilon)
rep = f/beta*(x-(1-exp(beta/epsilon*x))/(1-exp(beta/epsilon)));
end
end