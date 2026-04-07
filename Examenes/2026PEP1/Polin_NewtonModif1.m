function Polin_NewtonModif1(N, K)

    %Aproximaci'on inicial (OJO! Definir como vector COLUMNA):
    x0                  = ones(N,1);
    
    %Resolver con Newton--Raphson:
    t1                  = tic();
    [x, nIters, flag]   = NewtonModif1(@Polin_residuo, x0, 1e-6, 100, K);
    t2                  = toc(t1);
    if flag<0
        warning('El metodo no ha convergido')
    end
    
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

    