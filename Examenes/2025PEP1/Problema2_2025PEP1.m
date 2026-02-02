function Problema2_2025PEP1(N)
    
    %Creamos la matriz:
    A           = MatrizExamen1(N);
    
    %Creamos sistema:
    x_ex        = ones(N,1);
    b           = A*x_ex;
    
    %Representamos matriz:
    figure()
    spy(A)
    title('A')
    
    %----------------------------------------------------------------------
    %Factorizaci'on PAQ=LU:
        
    disp('Factorización PAQ=LU')
    
    tic
    [L,U,P,Q]   = lu(A);
    toc
    
    figure()
    spy(L+U)
    title('L+U')
    
    tic
    x           = Q*(U\(L\(P*b)));
    toc
    
    err         = norm(x-x_ex,Inf);
    display(err)
    
    %----------------------------------------------------------------------
    %Resolvemos con ILU0:
    
    disp('Anderson precondicionado con ILU0')
    
    tic
    [L,U]       = ilu0(A);
    toc
    
    figure()
    spy(L+U)
    title('L+U incompleto')
    
    %Resolvemos con Anderson:
    x0          = zeros(N,1);
    function g=gfunILU(x)
        g       = U\(L\(A*x-b));
    end
    tic
    [x,nIter,flag]  = Anderson1(@gfunILU, x0, 1e-8, 100, 20);
    toc
    if flag<0
        warning('No ha convergido')
    end
    
    %Error y n'umero de iteraciones:
    err         = norm(x-x_ex,Inf);
    display(nIter)
    display(err)
    
end