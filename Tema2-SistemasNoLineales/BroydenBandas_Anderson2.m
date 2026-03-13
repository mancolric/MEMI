function BroydenBandas_Anderson2(N) 

    %Aproximaci'on inicial:
    x0                  = repmat(-0.5,N,1);
    
    %Iniciamos cron'ometro:
    t1                  = tic();
    
    %Resolvemos con Anderson:
    [x, nIters, flag]   = Anderson1(@BroydenBandas_residuo2, x0, 1e-8, 100, 20);
    if flag<1
        warning('Resolvedor no ha convergido')
    end
    
    %Paramos cron'ometro:
    t2                  = toc(t1);
    
    %Representamos soluci'on:
    figure()
    plot(x, '-xb')
    
    %Mostramos informaci'on:
    display(N)
    display(t2)
    display(nIters)
    
end

    