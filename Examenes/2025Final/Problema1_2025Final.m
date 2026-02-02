function Problema1_2025Final(N) 
    %Probar con N=2,4,8,16. Escribir resultados con 4 cifras decimales. Con
    %qu'e regla se alcanza antes la convergencia??

    %Funci'on a integrar:
    gfun            = @(x) exp(-x).*cos(x);
    
    %Nodos y pesos en el intervalo [-1,1]:
    [xQuad, wQuad]  = ChebyshevGauss1(N);
    
    %Resultado:
    I_CG            = sum(wQuad .* gfun(xQuad) .* (1+xQuad).^0.125 );
    display(I_CG)
    
    %Nodos y pesos en el intervalo [-1,1]:
    [xQuad, wQuad]  = ReglaCuadratura1(N);
    
    %Resultado:
    I_regla1        = sum(wQuad .* gfun(xQuad));
    display(I_regla1)
    
end
 
