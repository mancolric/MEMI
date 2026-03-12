function SistemaLineal_Anderson(N) 

    %----------------------------------------------------------------------
    %Definimos sistema de ecuaciones:
    
    %Definimos matriz:
    A       = SL_MatrizDispersa1(XX);
    
    %Definimos soluci'on exacta y vector del lado derecho:
    x_ex    = rand(XX,1);
    b       = XX;
    
    %----------------------------------------------------------------------
    %Resoluci'on por método directo:
    
    t1      = tic();
    x       = XX;
    t2      = toc(XX);
    
    %Mostrar tiempo y error:
    disp('Metodo directo')
    display(XX)
    err     = norm(XX,Inf);
    display(XX)
    
    %----------------------------------------------------------------------
    %Resoluci'on por Anderson (I):
    
    %Condici'on inicial:
    x0      = zeros(XX,XX);
    
    %Aproximamos jacobiano:
    t1      = tic();
    D       = XX;
    t2      = toc(XX);
    
    %Definimos función residuo precondicionado:
    function g=gfunD(x)
        f   = XX;
        g   = XX;
    end
    
    t1                  = tic();
    [x, nIters, flag]   = Anderson1(XX, XX, XX, XX, XX);
    t2                  = t2+toc(XX);
    if flag<0
        warning(XX)
    end

    %Mostrar tiempo, n'umero de iteraciones y error:
    disp('Metodo iterativo (diag)')
    display(XX)
    display(XX)
    err     = norm(XX,Inf);
    display(XX)
    
    %----------------------------------------------------------------------
    %Resoluci'on por Anderson (II):
    
    %Aproximamos jacobiano:
    t1      = tic();
    A_L     = tril(XX);
    t2      = toc(XX);
    
    %Definimos función residuo precondicionado:
    function g=gfunL(x)
        f   = XX;
        g   = XX;
    end
    
    t1                  = tic();
    [x, nIters, flag]   = Anderson1(XX, XX, XX, XX, XX);
    t2                  = t2+toc(XX);
    if flag<0
        warning(XX)
    end

    %Mostrar tiempo, n'umero de iteraciones y error:
    disp('Metodo iterativo (tril)')
    display(XX)
    display(XX)
    err     = norm(XX,Inf);
    display(XX)

end

    