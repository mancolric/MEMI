function BroydenBandas_Newton(N)

    %Aproximaci'on inicial:
    x0                  = repmat(-0.5,N,1);
    
    %Resolvemos con Newton--Raphson:
    t1                  = tic();
    [x, nIters, flag]   = NewtonRaphson1(@BroydenBandas_residuo, x0, 1e-8, 100);
    if flag<1
        warning('Resolvedor no ha convergido')
    end
    t2                  = toc(t1);
    
    %Representamos soluci'on:
    figure()
    plot(x, '.-b')
    
    %Mostramos informaci'on:
    display(N)
    display(t2)
    display(nIters)
    
end

    