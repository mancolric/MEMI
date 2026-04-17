%I_num=Integral1(fun, xtrozos, N)
function I_num=Integral1(fun, xtrozos, N)

    %Regla de cuadratura en [-1,1]:
    [xhatQuad, whatQuad]    = ChebyQuad1(N);
    
    %Recorremos trozos:
    I_num       = 0.0;
    for jj=1:length(xtrozos)-1
        
        %L'imites del intervalo:
        aj      = xtrozos(jj);
        bj      = xtrozos(jj+1);
        
        %Nodos de cuadratura en [aj,bj]:
        xQuad   = 0.5*(aj+bj) + 0.5*(bj-aj)*xhatQuad;
        
        %Valor de la integral en el elemento:
        Ij      = sum(whatQuad.*fun(xQuad)) * 0.5*(bj-aj);
        I_num   = I_num+Ij;
        
    end
    
end
