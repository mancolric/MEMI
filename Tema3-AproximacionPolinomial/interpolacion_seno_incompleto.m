function interpolacion_seno(N)

    %Datos:
    fun     = @(x) XX;
    a       = XX;
    b       = XX;
    
    %Nodos de interpolaci'on:
    x_int   = linspace(XX,XX,XX).';
    
    %Calculamos coeficientes:
    cv      = PolyVander1(XX)\XX;
    
    %Nodos de evaluaci'on. Valor de la funci'on y del polinomio de
    %interpolaci'on en los mismos:
    x_eval  = linspace(XX).';    
    f_eval  = XX;
    p_eval  = PolyVander1(XX)*XX;
    
    %Representamos la soluci'on:
    figure()
    plot(XX, XX, 'xb')
    hold on
    plot(XX, XX, 'r')
    plot(XX, XX, 'ok')
    
    %Error m'aximo:
    disp(norm(XX,XX))
    
end