function Problema1_2026PEP2(N)
    
    %Datos:
    fun     = @(x) 1.0./(1.0+x.^2);
    a       = -3.0;
    b       = 4.0;
    
    %Calculamos coeficientes:
    cv      = proy_fun1(fun, a, b, N);
    
    %Nodos de evaluaci'on. Valor de la funci'on y del polinomio de
    %interpolaci'on en los mismos:
    x_eval  = linspace(a, b, 50*N).';   
    f_eval  = fun(x_eval);
    p_eval  = PolyVander1(x_eval, a, b, N)*cv;
    
    %Representamos la soluci'on:
    figure()
    plot(x_eval, f_eval, 'b')
    hold on
    plot(x_eval, p_eval, 'r')
    
    %Error m'aximo:
    disp(norm(f_eval-p_eval,Inf))
    
end