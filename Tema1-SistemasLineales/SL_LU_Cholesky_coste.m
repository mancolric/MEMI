function SL_LU_Cholesky_coste(Nv)

    %Longitud del vector de N's:
    NN          = length(Nv);
    
    %Reservamos memoria para los resultados:
    tFactor1v   = zeros(NN,1);
    tFactor2v   = zeros(NN,1);
    tSolve1v    = zeros(NN,1);
    tSolve2v    = zeros(NN,1);
    err1v       = zeros(NN,1);
    err2v       = zeros(NN,1);
    
    %Bucle para N:
    for ii=1:NN
        
        %Crear matriz y vector:
        N               = Nv(ii);
        B               = rand(N,N);
        A               = B.'*B;
        x_ast           = rand(N,1);
        b               = A*x_ast;
        
        %Factorización LU con pivotaje:
        t1              = tic;
        [L,U,P]         = LUFactor(A);
        tFactor1v(ii)   = toc(t1);
        
        %Solución con LUSolve:
        t1              = tic;
        x               = LUSolve(L,U,P,b);
        tSolve1v(ii)    = toc(t1);
        err1v(ii)       = norm(x-x_ast, Inf);
        
        %Factorización de Cholesky:
        t1              = tic;
        L               = CholeskyFactor(A);
        tFactor2v(ii)   = toc(t1);
        
        %Solución con LUSolve1:
        t1              = tic;
        x               = LLTSolve(L,b);
        tSolve2v(ii)    = toc(t1);
        err2v(ii)       = norm(x-x_ast, Inf);
        
    end
    
    %Gráfica tiempo-N:
    figure()
    loglog(Nv, tFactor1v, "b", Nv, tFactor2v, "r", ...
        Nv, tSolve1v, "c", Nv, tSolve2v, "m")
    grid('on')
    xlabel('N')
    ylabel('t [s]')
    legend('LUFactor', 'CholFactor', 'LUSolve', 'LLTSolve', 'location', 'best')
    
    figure()
    loglog(Nv, err1v, "b", Nv, err2v, "r")
    grid('on')
    xlabel('N')
    ylabel('err')
    
end