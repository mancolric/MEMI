function Burgers1D_DF(epsilon, Nx)

    %Creamos mallado:
    xv          = linspace(0.0, 2.0, Nx).';
    
%     %Probar esto con Nx, Ny pequeños y luego comentar:
%     %Probamos funci'on:
%     uv0         = rand(Nx,1);
%     [f0, J0]    = Burgers1D_DF_Residuo1(xv, epsilon, uv0, true);
%     Jnum        = JacobianEst(@(u) Burgers1D_DF_Residuo1(xv, epsilon, u, false), uv0, 1e-6);
%     display(norm(Jnum-J0,Inf))
%     return

    %Aproximaci'on inicial:
    uv0         = 1.0-0.5*xv;
    
    %Resolvemos con Newton:
    tic
    fun                 = @(u, CalcJ) Burgers1D_DF_Residuo1(xv, epsilon, u, CalcJ);
    [uv, nIters, flag]  = NewtonRaphson1(fun, uv0, 1e-8, 200);
    if flag<0
        warning('Newton no ha convergido')
    end
    toc
    display(nIters)
    
    %Soluci'on exacta en los nodos de la malla u=tanh((2-x)/(2epsilon) y error cometido:
    uv_ex       = tanh((2-xv)/(2*epsilon));
    
    %Representamos soluci'on:
    figure()
    plot(xv, uv_ex, 'xb')
    hold on
    plot(xv, uv, 'r')
    xlabel('x')
    ylabel('u')
    legend('ex.', 'num.')
    
    %Mostramos error y tama'no de malla:
    err         = norm(uv-uv_ex, Inf);
    display(err)
    hx          = xv(2)-xv(1);
    display(hx)
    
end
