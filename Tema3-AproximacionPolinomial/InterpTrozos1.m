%C = InterpTrozos1(fun, xtrozos, N)
%
%Recibe una función fun, un vector xtrozos que indica los trozos de la interpolación 
%y el grado N del polinomio de ajuste.
%
%Devuelve una matriz C de dimensiones (N+1)*(length(xv)-1).
%
%Se utilizan nodos de Chebyshev en cada trozo.

function C = InterpTrozos1(fun, xtrozos, N)

    %N'umero de trozos:
    nTrozos = length(xtrozos)-1;
    
    %Nodos de Chebyshev en el intervalo [-1,1] y matriz de Vandermonde:
    xhatv   = ChebyNodos1(-1,1,N);
    V       = PolyVander1(xhatv, -1, 1, N);
    
    %Matriz del lado derecho:
    F       = zeros(N+1,nTrozos);
    for jj=1:nTrozos
        
        %L'imites del trozo:
        a_j     = xtrozos(jj);
        b_j     = xtrozos(jj+1);
        
        %Posici'on de los nodos y valor de la funci'on en los mismos:
        xv_i    = 0.5*(a_j+b_j) + 0.5*(b_j-a_j)*xhatv;
        F(:,jj) = fun(xv_i);
        
    end
    
    %Hallamos coeficientes:
    C       = V\F;
        
end
        
