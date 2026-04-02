function Problema2_2026PEP1(N)

    %Datos:
    hconv       = 50.0;
    L           = 0.1;
    T_0         = 400;
    T_inf       = 298;
    k0          = 0.2;
    
    %Creamos mallado y aproximaci'on inicial:
    xv          = linspace(0, L, N).';
    u0          = cat(1, linspace(T_0, T_inf, N).', 0);
    
    %Calculamos jacobiano inicial:
    [f0,J0]     = ParedResiduo1(u0,true);
    L           = tril(J0);
    U           = triu(J0);
    function g=gfun(u)
        [f,~]   = ParedResiduo1(u,false);
        g       = 0.5*(L\f + U\f);
    end 
        
    %Resolvemos con Anderson:
    t1                  = tic();
    [u, nIters, flag]   = Anderson1(@gfun, u0, 1e-6, 100, 10);
    t2                  = toc(t1);
    display(t2)
    display(nIters)
    if flag<0
        warning('El metodo no ha convergido')
    end
    
    %Representamos soluci'on:
    Tv          = u(1:N);
    q           = u(N+1);
    T_ext       = Tv(N);
    display(q)
    display(T_ext)
    
    figure()
    plot(xv, Tv, '.-b')
    
end