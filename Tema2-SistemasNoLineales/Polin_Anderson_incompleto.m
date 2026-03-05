function Polin_Anderson(N) 

    %Aproximaci'on inicial (OJO! Definir como vector COLUMNA):
    x0                  = ones(XX,XX);
    
    %Ponemos el cronómetro en marcha:
    t1                  = tic();
    
    %Calculamos y factorizamos el Jacobiano en x0:
    [~,J0]              = Polin_residuo(XX, XX);
    [XX]                = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(x)
        [f,~]           = XX(XX)
        g               = XX
    end

    %Reolvemos con Anderson:
    [x, nIters, flag]   = Anderson1(XX, XX, XX, XX, XX);
    if flag<0
        warning('XX')
    end
    
    %Paramos cron'metro:
    t2                  = toc(XX);
        
    %Soluci'on exacta (como vector columna) y error en norma infinita:
    x_ex                = XX;
    err                 = norm(XX,Inf);
    
    %Gr'aficas:
    figure()
    plot(XX, '+-b')
    hold on
    plot(XX, 'r')
    
    %Info por pantalla:
    display(XX)
    display(XX)
    display(XX)
    display(XX)

end

    