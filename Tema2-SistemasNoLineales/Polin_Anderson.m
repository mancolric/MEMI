function Polin_Anderson(N) 

    %Aproximaci'on inicial (OJO! Definir como vector COLUMNA):
    x0                  = ones(N,1);
    
    %Ponemos el cronómetro en marcha:
    t1                  = tic();
    
    %Calculamos y factorizamos el Jacobiano en x0:
    [~,J0]              = Polin_residuo(x0, true);
    [L,U,P]             = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(x)
        [f,~]           = Polin_residuo(x, false);
        g               = U\(L\(P*f));
    end

    %Reolvemos con Anderson:
    [x, nIters, flag]   = Anderson1(@gfun, x0, 1e-6, 100, 20);
    if flag<0
        warning('El metodo no ha convergido')
    end
    
    %Paramos cron'metro:
    t2                  = toc(t1);
        
    %Soluci'on exacta (como vector columna) y error en norma infinita:
    x_ex                = cos(2*pi*(1:N)/N).';
    err                 = norm(x-x_ex,Inf);
    
    %Gr'aficas:
    figure()
    plot(x, '+-b')
    hold on
    plot(x_ex, 'r')
    
    %Info por pantalla:
    display(N)
    display(t2)
    display(nIters)
    display(err)

end

    