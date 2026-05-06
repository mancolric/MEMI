function Burgers1D_DF(epsilon, Nx)

    %Creamos mallado:
    xv          = linspace(0.0, 2.0, XX).';
    
    %Aproximaci'on inicial:
    uv0         = XX;
    
    %Resolvemos con Newton:
    tic
    fun                 = @(u, CalcJ) Burgers1D_DF_Residuo1(xv, epsilon, u, CalcJ);
    [uv, nIters, flag]  = NewtonRaphson1(XX, XX, 1e-8, 200);
    if flag<0
        warning('Newton no ha convergido')
    end
    toc
    display(nIters)
    
    %Soluci'on exacta en los nodos de la malla u=tanh((2-x)/(2epsilon) y error cometido:
    uv_ex       = tanh(XX);
    
    %Representamos soluci'on:
    figure()
    plot(xv, uv_ex, 'xb')
    hold on
    plot(xv, uv, 'r')
    xlabel('x')
    ylabel('u')
    legend('ex.', 'num.')
    
    %Mostramos error y tama'no de malla:
    err         = norm(XX, Inf);
    display(err)
    hx          = XX;
    display(hx)
    
end
