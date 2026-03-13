function SistemaLineal_Anderson(N) 

    %----------------------------------------------------------------------
    %Definimos sistema de ecuaciones:
    
    %Definimos matriz:
    A       = SL_MatrizDispersa1(N);
    
    %Definimos soluci'on exacta y vector del lado derecho:
    x_ex    = rand(N,1);
    b       = A*x_ex;
    
    %----------------------------------------------------------------------
    %Resoluci'on por método directo:
    
    t1      = tic();
    x       = A\b;
    t2      = toc(t1);
    
    %Mostrar tiempo y error:
    disp('Metodo directo')
    display(t2)
    err     = norm(x-x_ex,Inf);
    display(err)
    
    %----------------------------------------------------------------------
    %Resoluci'on por Anderson (I):
    
    %Condici'on inicial:
    x0      = zeros(N,1);
    
    %Aproximamos jacobiano:
    t1      = tic();
    D       = diag(diag(A));
    t2      = toc(t1);
    
    %Definimos función residuo precondicionado:
    function g=gfunD(x)
        f   = A*x-b;
        g   = D\f;
    end
    
    t1                  = tic();
    [x, nIters, flag]   = Anderson1(@gfunD, x0, 1e-8, 100, 10);
    t2                  = t2+toc(t1);
    if flag<0
        warning('El método no ha convergido')
    end

    %Mostrar tiempo, n'umero de iteraciones y error:
    disp('Metodo iterativo (diag)')
    display(t2)
    display(nIters)
    err     = norm(x-x_ex,Inf);
    display(err)
    
    %----------------------------------------------------------------------
    %Resoluci'on por Anderson (II):
    
    %Aproximamos jacobiano:
    t1      = tic();
    A_L     = tril(A);
    t2      = toc(t1);
    
    %Definimos función residuo precondicionado:
    function g=gfunL(x)
        f   = A*x-b;
        g   = A_L\f;
    end
    
    t1                  = tic();
    [x, nIters, flag]   = Anderson1(@gfunL, x0, 1e-8, 100, 10);
    t2                  = t2+toc(t1);
    if flag<0
        warning('El método no ha convergido')
    end

    %Mostrar tiempo, n'umero de iteraciones y error:
    disp('Metodo iterativo (tril)')
    display(t2)
    display(nIters)
    err     = norm(x-x_ex,Inf);
    display(err)

end

    