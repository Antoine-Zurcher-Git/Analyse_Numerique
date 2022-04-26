clear;close all;

Nx = 70;
Ny = 70;%Ne marche pas encore
N = Nx;
Al = zeros(Nx*Ny,1);
coeff = 0.1;%0.15;%0.075;
positionSource = Nx*Ny/5+Ny/2;
Al(positionSource) = 1;
Alp = Al;
un=ones(N-1,1);
H=(4*eye(N)-diag(un,1)-diag(un,-1));
I = eye(N);
A = zeros(N^2,N^2);
periode = 100*0.075/coeff;

for i = 1 : N
    A(1+(i-1)*N:i*N,1+(i-1)*N:i*N) = H;
    if i>1
        A(1+(i-1)*N:i*N,1+(i-2)*N:(i-1)*N) = -I; 
    end
     if i<N
        A(1+(i-1)*N:i*N,1+(i)*N:(i+1)*N) = -I; 
    end
end
A = -A*coeff*coeff;
A = sparse(A);
x=linspace(0,1,Nx);
y=linspace(0,1,Nx);
Nmax = 600;

colormap(gray);

for i=1:Nmax
    clf
    Alpp = Al;
    %Al
    Al = A*Al+2*Al-Alp;
    Al(positionSource) = cos(2*pi*i/periode);%cos(i/50*pi);
    %Al
    Alp = Alpp;
    
%     for x=1:Nx
%         for y=1:Ny
%             cv = (Al((x-1)*Nx+y)+0.5)/2;
%             if(cv > 1)
%                 cv = 1;
%             end
%             if(cv < 0)
%                 cv = 0;
%             end
%             color = [cv cv cv];
%             rectangle('Position',[(x-1) (y-1) 1 1],'FaceColor',color,'EdgeColor',color)
%         end
%     end
%     axis([0 Nx 0 Ny])
%     title(num2str(round(i*100/Nmax))+"%")
%     
    Alt = 1.85*Al;
    Alt(positionSource) = Alt(positionSource+1);
    AlR =reshape(Alt,Nx,Nx);
    AlR(70,70)=1;
    AlR(70,69)=-1;
    graph = pcolor(x,y,AlR);
    %surf(x,y,AlR)
    xlabel('x')
    ylabel('y')
    axis([0 1 0 1 -1 1]);
    title(num2str(round(i*100/Nmax))+"%")
    %saveas(graph,"img/"+i+".png");
    
    
    pause(0.1);
end


