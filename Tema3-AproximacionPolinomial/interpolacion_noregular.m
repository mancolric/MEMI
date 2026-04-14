function interpolacion_noregular(N)
    
    %Datos:
    fun     = @(x) heaviside(x);
%     fun     = @(x) abs(x);
%     fun     = @(x) x.*abs(x);
    a       = -3.0;
    b       = 4.0;
    
    %Nodos de interpolaci'on:
    x_int   = ChebyNodos1(a,b,N);
    
    %Calculamos coeficientes:
    cv      = PolyVander1(x_int, a, b, N)\fun(x_int);
    
    %Nodos de evaluaci'on. Valor de la funci'on y del polinomio de
    %interpolaci'on en los mismos:
    x_eval  = linspace(a, b, 100).';   
    f_eval  = fun(x_eval);
    p_eval  = PolyVander1(x_eval, a, b, N)*cv;
    
    %Representamos la soluci'on:
    figure()
    plot(x_eval, f_eval, 'xb')
    hold on
    plot(x_eval, p_eval, 'r')
    plot(x_int, fun(x_int), 'ok')
    
    %Error m'aximo:
    disp(norm(f_eval-p_eval,Inf))
    
end