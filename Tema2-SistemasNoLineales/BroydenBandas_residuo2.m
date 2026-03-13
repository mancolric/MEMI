function g = BroydenBandas_residuo2(x)

    %N'umero de variables:
    N       = length(x);
    
    %Residuo precondicionado:
    g       = zeros(N,1);
    for ii=1:N
        
        %Defs k1 y k2:
        k1      = max(1,ii-5);
        k2      = min(N,ii+1);
        
        %Residuo sin precondicionar:
        f_i     = (2+5*x(ii)^2)*x(ii) + 1;
        for kk=k1:k2
            f_i = f_i + x(kk)*(1+x(kk));
        end
        
        %Término (ii,ii) de la matriz jacobiana:
        diagJ_i = 10*x(ii)^2 + (2+5*x(ii)^2) + 1+x(ii)+x(ii);
        
        %Residuo precondicionado:
        g(ii)   = f_i/diagJ_i;
                    
    end
    
end
