function err=interpolacion_trozos_Runge(nTrozos, N)

    %Datos:
    fun     = @(x) 1.0./(1.0+x.^2);
    a       = -3.0;
    b       = 4.0;
    
    %Definimos trozos:
    xtrozos = linspace(a, b, nTrozos+1).';
    
    %Calculamos coeficientes:
    Cm      = InterpTrozos1(fun, xtrozos, N);
    
    %Representamos la soluci'on:
    x_plot  = linspace(a, b, 10*nTrozos*N).';        %Interpolaci'on
    f_plot  = fun(x_plot);
    p_plot  = EvalInterpTrozos1(Cm, xtrozos, x_plot);
    
    figure()
    plot(x_plot, f_plot, 'xb')
    hold on
    plot(x_plot, p_plot, 'r')
%     plot(xtrozos, fun(xtrozos), 'sr')
    
    %Error m'aximo:
    err     = norm(f_plot-p_plot,Inf);
    
end