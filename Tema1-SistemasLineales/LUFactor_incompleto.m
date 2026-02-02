function [L,U,P] = LUFactor(A)

    %Dimensiones:
    N       = size(A,2);
    if size(A,1)~=N
        error(???)
    end
    
    %Crear P, L y U. NOTA: eye(N) genera la matriz identidad de dimensión
    %N:
    P       = ??;
    L       = ??;
    U       = ??;
    
    %Iteramos:
    for ii=1:N-1
        
        %Buscamos elemento de mayor valor absoluto en la columna
        %U(ii:N,ii):
        mm      = ii;
        Umax    = abs(U(ii,ii));
        for kk=ii+1:N
            ???
        end
        
        %Permutamos fila ii con fila mm:
        aux             = ???
        P(mm,1:N)       = ???
        P(ii,1:N)       = ???
        %
        aux             = ???
        L(mm,1:ii-1)    = ???
        L(ii,1:ii-1)    = ???;
        %
        aux             = ???;
        U(???)          = ???;
        U(???)          = ???;
        
        %Generamos ceros bajo el pivote:
        for kk=ii+1:N
            L(kk,ii)    = ???;
            U(kk,ii:N)  = ???;
        end
        
    end
    
end
