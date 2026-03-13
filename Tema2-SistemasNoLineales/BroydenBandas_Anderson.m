function BroydenBandas_Anderson(N) 

    %Aproximaci'on inicial:
    x0                  = repmat(-0.5,N,1);
    
    %Iniciamos cron'ometro:
    t1                  = tic();
    
    %Calculamos y factorizamos Jacobiano en x0:
    [~,J0]              = BroydenBandas_residuo(x0, true);
    [L,U,P,Q]           = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(x)
        [f,~]           = BroydenBandas_residuo(x, false);
        g               = Q*(U\(L\(P*f)));
    end

    %Resolvemos con Anderson:
    [x, nIters, flag]   = Anderson1(@gfun, x0, 1e-8, 100, 20);
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

    