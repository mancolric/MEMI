function [f,J] = BroydenBandas_residuo(x, CalcJ)

    %N'umero de variables:
    N       = length(x);
    
    %Residuo:
    f       = zeros(N,1);
    for ii=1:N
        
        %Defs k1 y k2:
        k1      = max(1,ii-5);
        k2      = min(N,ii+1);
        
        %Residuo:
        f(ii)   = (2+5*x(ii)^2)*x(ii) + 1;
        for kk=k1:k2
            f(ii)   = f(ii) + x(kk)*(1+x(kk));
        end
        
    end
    
    %Jacobiano:
    if CalcJ
        
        %Inicializamos vectores con elementos no nulos:
        filas       = [];
        cols        = [];
        vals        = [];
        
        %Recorremos filas de la matriz:
        for ii=1:N
            
            %Defs k1 y k2:
            k1      = max(1,ii-5);
            k2      = min(N,ii+1);
            
            %Derivada del t'ermino (2+5*x_i^2)*x_i:
            filas   = cat(1, filas, ii);
            cols    = cat(1, cols, ii);
            vals    = cat(1, vals, 2+15*x(ii)^2);
            
            %Derivadas de los términos en el sumatorio:
            for jj=k1:k2
                filas   = cat(1, filas, ii);
                cols    = cat(1, cols, jj);
                vals    = cat(1, vals, 1+2*x(jj));
            end
            
        end
        
        %Construimos jacobiana:
        J       = sparse(filas, cols, vals, N, N);
        
    else
        
        J       = NaN;
        
    end
    
end
