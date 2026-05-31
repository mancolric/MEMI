function cv = proy_fun1(fun, a, b, N)

    %Matriz del sistema:
    Am       = zeros(N+1, N+1);
    for ii=0:N
        for jj=0:N
            Am(ii+1,jj+1)   = (1-(-1)^(ii+jj+1))/(ii+jj+1);
        end
    end
    
    %Vector del lado derecho:
    zv                      = zeros(N+1, 1);
    [xhatQuad, whatQuad]    = ChebyQuad1(2*N+2); %Regla de cuadratura:
    xQuad                   = 0.5*(a+b) + 0.5*(b-a)*xhatQuad;
    fQuad                   = fun(xQuad);
    for ii=0:N
        zv(ii+1)            = sum(whatQuad .* fQuad .* xhatQuad.^ii); 
    end
    
    %Resolvemos el sistema:
    cv      = Am\zv;
    
end