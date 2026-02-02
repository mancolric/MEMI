function Problema2_2025PEP2(mu, Nx)

    %Creamos mallado:
    xv          = linspace(0.0, 1.0, Nx).';

    %Condici'on inicial:
    uL          = cosh(0.2/mu)*mu;
    uR          = cosh(0.8/mu)*mu;
    uv0         = uL + (uR-uL)*xv + sin(2*pi*xv/1.0);
    
    
    %Resolvemos con Anderson:
    tic
    [uv, nIters, flag]  = Anderson1(@(u) Catenaria_Residuo1(xv,mu,u), uv0, 1e-10, 1000, 100);
    if flag<0
        warning('Resolvedor no ha convergido')
    end
    toc
    
    %Soluci'on exacta en los nodos de la malla:
    uv_ex               = cosh((xv-0.2)/mu)*mu;
    
    %Representamos soluci'on:
    figure()
    plot(xv, uv_ex, 'xb')
    hold on
    plot(xv, uv, 'r')
    xlabel('x')
    ylabel('y')
    
    %Error cometido:
    err         = norm(uv-uv_ex, Inf);
    display(err)
    
end
