function Polin_Newton(N)

    %Aproximaci'on inicial (OJO! Definir como vector COLUMNA):
    x0                  = ones(??,??);
    
    %Resolver con Newton--Raphson:
    t1                  = tic();
    [???]               = NewtonRaphson1(@???, ??, ??, ??);
    t2                  = toc(??);
    if flag<0
        warning('???')
    end
    
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

    