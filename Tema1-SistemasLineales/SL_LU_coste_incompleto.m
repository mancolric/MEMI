function SL_LU_coste(Nv)

    %Longitud del vector de N's:
    NN          = length(Nv);
    
    %Reservamos memoria para los resultados:
    tFactorv    = zeros(NN,1);
    tSolvev     = zeros(NN,1);
    errv        = zeros(NN,1);
    
    %Bucle para N:
    for ii=1:NN
        
        %Crear matriz y vector:
        N               = Nv(ii);
        A               = ???
        x_ast           = ???
        b               = ???
        
        %Factorización LU:
        t1              = tic;
        [L,U,P]         = ????
        tFactorv(ii)    = toc(t1);
        
        %Solución con LUSolve:
        t1              = tic;
        ????
        tSolvev(ii)     = ????;
        errv(ii)        = norm(???, Inf);
        
    end
    
    %Gráfica error-N:
    figure()
    loglog(??, ??)
    grid('on')
    xlabel(??)
    ylabel(??)
    
    %Gráfica tiempo-N:
    figure()
    loglog(??, ??, 'b')
    hold on
    loglog(??, ??, 'r')
    grid('on')
    xlabel(??)
    ylabel(??)
    legend(??, ??, 'location', 'best')
    
end