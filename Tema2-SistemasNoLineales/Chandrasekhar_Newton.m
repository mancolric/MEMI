function Chandrasekhar_Newton(N)

    %Aproximaci'on inicial:
    H0                  = ones(N,1);
    
    %Resolvemos con Newton--Raphson:
    t1                  = tic();
    [H, nIters, flag]   = NewtonRaphson1(@Chandrasekhar_residuo, H0, 1e-8, 100);
    if flag<1
        warning('Resolvedor no ha convergido')
    end
    t2                  = toc(t1);
    
    %Representamos soluci'on:
    figure()
    x                   = ((1:N).'-0.5)/N;
    plot(x, H, '.-b')
    
    %Mostramos resultados:
    display(N)
    display(t2)
    display(nIters)
    
end

    