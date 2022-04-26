clear

%Parametres classique
n = 3;
h = 1/(n+1);

beta0 = 1;
epsilon = 0.01;


affichage = true;
if affichage
    %Axe X sur lequel on trace, on a besoin d'avoir un h plus petit pour pas
    %avoir que des droites
    lesX = 0:(h/100):1;
    
    %Calcul de omega1, 2 et 3
    lesY1 = fomega(lesX,1,h,beta0,epsilon);
    lesY2 = fomega(lesX,2,h,beta0,epsilon);
    lesY3 = fomega(lesX,3,h,beta0,epsilon);
    
    %Affichage
    figure;
    hold on
    plot(lesX,lesY1,lesX,lesY2,lesX,lesY3)
    legend("\omega_1", "\omega_2", "\omega_3")

    title("\epsilon =" + string(epsilon))
    hold off
end


function [rep] = fomega(x,i,h,beta0,epsilon)
    rep = zeros(1,length(x));
    
    %Calcul de gamma
    gamma = beta0*h/epsilon;
    
    %Calcul de alpha
    alpha = gamma*h/(12*beta0);
    if gamma >=6
        alpha=h/(beta0*2);
    end
    
    
    for k=1:length(x)
        %Calcul de omega(x)
        if  x(k) > (i-1)*h && x(k) < (i)*h
            rep(k) = ((x(k)-(i-1)*h)/h)+alpha*beta0*1/h;
        end
        if  x(k) >= i*h && x(k) < (i+1)*h
            rep(k) = -((x(k)-(i+1)*h)/h)-alpha*beta0*1/h;
        end
    end
end