function Problema1_2025PEP1

    %Par'ametros:
    N       = 10;
    Q       = repmat(0.5,N,1);
    K       = 2.1;
    lambda  = 0.4;
    L       = 8.0;
    
    %Condici'on inicial:
    x0      = linspace(0.1*L, 0.9*L, N).';
%     [f0,J0]     = CargasElectricasResiduo1(K,lambda,L,Q,x0,true);
%     Jnum        = JacobianEst(@(x,CalcJ) CargasElectricasResiduo1(K,lambda,L,Q,x,CalcJ), x0, 1e-6);
%     disp(Jnum-J0)
    
    %Resoluci'on con Newton:
    fun                 = @(x,CalcJ) CargasElectricasResiduo1(K,lambda,L,Q,x,CalcJ);
    tic
    [xN,nIters,flag]    = NewtonRaphson1(fun, x0, 1e-8, 20);
    if flag<0
        warning('No ha convergido')
    end
    toc
    disp(nIters)
    
    %Representamos solución:
    figure()
    plot(xN, zeros(size(xN)), 'ob')
    xlim([0.0, L])
    
end
