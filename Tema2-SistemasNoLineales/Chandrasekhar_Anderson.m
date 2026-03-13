function Chandrasekhar_Anderson(N) 

    %Aproximaci'on inicial:
    H0                  = zeros(N,1);
    
    %Iniciamos cron'ometro:
    t1                  = tic();
    
    %Calculamos Jacobiano en x0:
    [~,J0]              = Chandrasekhar_residuo(H0, true);
    [L,U,P]             = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(H)
        [f,~]           = Chandrasekhar_residuo(H, false);
        g               = U\(L\(P*f));
    end

    %Resolvemos con Anderson:
    [H, nIters, flag]   = Anderson1(@gfun, H0, 1e-8, 100, 10);
    
    %Paramos cron'ometro:
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

    