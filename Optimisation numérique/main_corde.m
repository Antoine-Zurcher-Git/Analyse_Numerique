
clear
close all

N = 20;
eps = 0.1;
rho = eps/3;

u = rand(2*N,1);


for i = 1 : 400
    
    [val,grad] = energie(u);
    [valp,gradp] = penalisation(u);
    u = u - rho*( grad + 1/eps*gradp );
    
    % dessin
    x = [0 ; u(1:N) ; 1];
    y = [1 ; u(N+1:2*N) ; 3/2];
    graph = plot(x,y,'-o');
    title("Iteration n°"+i);
    %saveas(graph,"img/"+i+".png");
    pause(0.01);
    
end
