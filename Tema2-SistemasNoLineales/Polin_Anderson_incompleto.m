function Polin_Anderson(N) 

    %Aproximaci'on inicial (OJO! Definir como vector COLUMNA):
    x0                  = ones(??,??);
    
    %Ponemos el cronómetro en marcha:
    t1                  = tic();
    
    %Calculamos y factorizamos el Jacobiano en x0:
    [~,J0]              = Polin_residuo(??, ??);
    [??]                = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(x)
        [f,~]           = ???
        g               = ???
    end

    %Reolvemos con Anderson:
    [x, nIters, flag]   = Anderson1(???, ???, ???, ???, ???);
    if flag<0
        warning('???')
    end
    
    %Paramos cron'metro:
    t2                  = toc(??);
        
    %Soluci'on exacta (como vector columna) y error en norma infinita:
    x_ex                = ??;
    err                 = norm(??,Inf);
    
    %Gr'aficas:
    figure()
    plot(??, '+-b')
    hold on
    plot(??, 'r')
    
    %Info por pantalla:
    display(?)
    display(?)
    display(?)
    display(?)

end

    