dt=500;
sir=zeros(3,dt);
r0=_; % para r0 constante
c=0.14;
n=45919049; % população inicial de sp
h=1;
sir(1,1)=n-_-(_-_)-_; % população - casos no dia - (numeros acumulado de casos - numero de casos no dia) - numero acumulado de mortes
sir(2,1)=_; % numero de casos no dia
sir(3,1)=(_-_)+_; % (numeros acumulado de casos - numero de casos no dia) + numero acumulado de mortes
i=0;
t0=141; % para r0 inconstante
for e=randn(0,dt)
    t0=t0+1; % para r0 inconstante
    r0=0.0000000007*(t0^5)-0.0000002*(t0^4)+0.00002*(t0^3)-0.0003*(t0^2)- 0.0657*t0+3.7598; % para r0 inconstante
    i=i+1;
    if i~=1
        k1=[h*((-c)*r0*sir(2,i-1)*sir(1,i-1)/n)
            h*c*((r0*sir(2,i-1)*sir(1,i-1)/n)-sir(2,i-1))
            h*c*sir(2,i-1)];
        k2=[h*((-c)*r0*(sir(2,i-1)+(k1(2,1)/2))*(sir(1,i-1)+(k1(1,1)/2))/n)
            h*c*((r0*(sir(2,i-1)+(k1(2,1)/2))*(sir(1,i-1)+(k1(1,1)/2))/n)-(sir(2,i-1)+(k1(2,1)/2)))
            h*c*(sir(2,i-1)+(k1(2,1)/2))];
        k3=[h*((-c)*r0*(sir(2,i-1)+(k2(2,1)/2))*(sir(1,i-1)+(k2(1,1)/2))/n)
            h*c*((r0*(sir(2,i-1)+(k2(2,1)/2))*(sir(1,i-1)+(k2(1,1)/2))/n)-(sir(2,i-1)+(k2(2,1)/2)))
            h*c*(sir(2,i-1)+(k2(2,1)/2))];
        k4=[h*((-c)*r0*(sir(2,i-1)+(k3(2,1)))*(sir(1,i-1)+(k3(1,1)))/n)
            h*c*((r0*(sir(2,i-1)+(k3(2,1)))*(sir(1,i-1)+(k3(1,1)))/n)-(sir(2,i-1)+(k3(2,1))))
            h*c*(sir(2,i-1)+(k3(2,1)))];
        sir(1,i)=sir(1,i-1)+(1/6)*(k1(1,1)+2*k2(1,1)+2*k3(1,1)+k4(1,1));
        sir(2,i)=sir(2,i-1)+(1/6)*(k1(2,1)+2*k2(2,1)+2*k3(2,1)+k4(2,1));
        sir(3,i)=sir(3,i-1)+(1/6)*(k1(3,1)+2*k2(3,1)+2*k3(3,1)+k4(3,1));
    end
end
T=zeros(1,dt);
i=0;
t=-1;
for e=randn(0,dt)
    i=i+1;
    t=t+1;
    T(1,i)=t;
end
x1=T';
y1=sir(_,:)'; % 2 para plotar I(t) , 3 para plotar R(t)
plot(x1,y1);