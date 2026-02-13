function L=CholeskyFactor(A)

    %Tama'no de la matriz:
    N       = size(A,1);
    if size(A,2)~=N
        error('La matriz debe ser cuadrada')
    end
    
    %Reservamos memoria:
    L       = zeros(N,N);
    
    %Recorremos filas de A:
    for ii=1:N
        
        %T'erminos L_ij, con j<i. Utilizamos f'ormula 
        %   A_ij = sum_(k=1)^(j-1) L_ik L_ij + L_ij*L_jj
        for jj=1:ii-1
            S           = sum( L(ii,1:jj-1).*L(jj,1:jj-1) );
            L(ii,jj)    = (A(ii,jj)-S)/L(jj,jj);
        end
        
        %T'erminos L_ii:
        S               = sum( L(ii,1:ii-1).*L(ii,1:ii-1) );
        S               = A(ii,ii)-S;
        if S<=0
            error('Matriz no es definida positiva')
        end
        L(ii,ii)        = sqrt(S);
        
    end
    
end