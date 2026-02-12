function [L,U,P] = LUFactor(A)

    %Dimensiones:
    N       = size(A,2);
    if size(A,1)~=N
        error('La matriz debe ser cuadrada')
    end
    
    %Crear P, L y U. NOTA: eye(N) genera la matriz identidad de dimensión
    %N:
    P       = eye(N);   
    L       = eye(N);
    U       = A;
    
    %Iteramos:
    for ii=1:N-1
        
        %Buscamos elemento de mayor valor absoluto en la columna
        %U(ii:N,ii):
        mm      = ii;
        Umax    = abs(U(ii,ii));
        for kk=ii+1:N
            if abs(U(kk,ii))>Umax
                mm      = kk;
                Umax    = abs(U(kk,ii));
            end
        end
        
        %Permutamos fila ii con fila mm:
        aux             = P(mm,1:N);
        P(mm,1:N)       = P(ii,1:N);
        P(ii,1:N)       = aux;
        %
        aux             = L(mm,1:ii-1);
        L(mm,1:ii-1)    = L(ii,1:ii-1);
        L(ii,1:ii-1)    = aux;
        %
        aux             = U(mm,ii:N);
        U(mm,ii:N)      = U(ii,ii:N);
        U(ii,ii:N)      = aux;
        
        %Generamos ceros bajo el pivote:
        for kk=ii+1:N
            L(kk,ii)    = U(kk,ii)/U(ii,ii);
            U(kk,ii:N)  = U(kk,ii:N)-L(kk,ii)*U(ii,ii:N);
            U(kk,ii)    = 0.0;  %Corregimos errores de redondeo
        end
        
    end
    
end
