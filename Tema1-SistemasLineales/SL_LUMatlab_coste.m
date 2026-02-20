function SL_LUMatlab_coste(Nv)

    %Longitud del vector de N's:
    NN          = length(Nv);
    
    %Reservamos memoria para los resultados:
    tLUv        = zeros(NN,1);
    tSolvev     = zeros(NN,1);
    errv        = zeros(NN,1);
    
    %Bucle para N:
    for ii=1:NN
        
        %Crear matriz y vector:
        N           = Nv(ii);
        A           = rand(N,N);
        x_ast       = rand(N,1);
        b           = A*x_ast;
        
        %Factorización LU:
        t1          = tic;
        [L,U,P]     = lu(A);
        tLUv(ii)    = toc(t1);
        
        %Solución con LUSolve1:
        t1          = tic;
        x           = U\(L\(P*b));
        tSolvev(ii) = toc(t1);
        errv(ii)    = norm(x-x_ast, Inf);
        
    end
    
    %Gráfica error-N:
    figure()
    loglog(Nv, errv)
    grid('on')
    xlabel('N')
    ylabel('err')
    
    %Gráfica tiempo-N:
    figure()
    loglog(Nv, tLUv, 'b')
    hold on
    loglog(Nv, tSolvev, 'r')
    grid('on')
    xlabel('N')
    ylabel('t [s]')
    legend('LUFactor', 'LUSolve', 'location', 'best')
    
end