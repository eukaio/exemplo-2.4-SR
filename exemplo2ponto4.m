clear all
clc
y=[1 2 25 5];
u=[25 5];

%a
N=length(y);
for i=1:N
    if i==1
    else
        a(i-1)=y(i);
    end
end

%b
M=length(u);
for j=1:M
    b(j)=u(j);
end

%beta
for h=1:N-M
    b(M+h)=0;
end

Beta(1)=b(1);
n=length(a);
for k=1:n
    Beta(k+1)=b(k+1);
    for l=1:k
    Beta(k+1)=Beta(k+1)-a(l)*Beta(k+1-l);
    end
end
Beta

%x ponto

for i=1:n    
    Xponto(i,1)=sym(sprintf('X%d',i));    
end


%A
for i=1:n
    for j=1:n
        if j-i==1
            A(i,j)=1;
        else
        A(i,j)=0;
        end
    end
end
for i=1:n
    A(n,i)=-a(n+1-i);
end


%x
for i=1:n    
    x(i,1)=sym(sprintf('x%d',i));    
end


%B
for i=1:n    
    B(i,1)=Beta(i+1);    
end


%C não sei se foi pedido posição, velocidade ou aceleração
%por enquanto deixo tudo zero

for i=1:n
    
    C(1,i)=0;    
end


%D
D=Beta(1);


%só para comparar com as matrizes da função pronta do matlab
[Aml,Bml,Cml,Dml]= tf2ss(u,y);

A
Aml
B
Bml
C
Cml
D
Dml
