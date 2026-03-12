%[x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)
%
function [x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)

    %Comprobamos que x0 es vector columna:
    if size(x0,2)>1
        error('La condicion inicial debe ser un vector columna')
    end
    %Aseguramos que M<=N
    N           = size(x0,1);
    M           = min(N, M); 
    
    %Primera iteraci'on:
    nIters      = 0;
    x_k         = x0;                   %soluci'on
    g_k         = gfun(x_k);            %residuo precondicionado    
    p_k         = -g_k;                 %paso
    Xm          = zeros(N,M);           %matrices con info 'ultimos pasos
    Gm          = zeros(N,M);
    while true

        %Salimos del bucle:
        if norm(p_k)<=sqrt(N)*Tol
            flag    = 1;
            break
        elseif nIters==MaxIter
            flag   = -1;
            break
        end

        %Actualizamos x_nm1 y g_nm1:
        x_km1       = x_k;
        g_km1       = g_k;
        
        %Actualizamos x_n y g_n:
        nIters      = nIters+1;
        x_k         = x_k + p_k;
        g_k         = gfun(x_k);
        
        %Actualizamos matrices X y G:
        Deltag_norm = norm(g_k-g_km1) + 1e-12;
        Xm(:,2:M)   = Xm(:,1:M-1);
        Xm(:,1)     = (x_k - x_km1)/Deltag_norm;
        Gm(:,2:M)   = Gm(:,1:M-1);
        Gm(:,1)     = (g_k - g_km1)/Deltag_norm;
        
        %Factorizaci'on en valores singulares de G:
        [U,S,V]                     = svd(Gm,0);   %S=Sigma
        
        %Pseudoinversa de S:
        S_diag                      = diag(S);
        S_psinv_diag                = 1.0./S_diag;
        S_psinv_diag(S_diag<1e-10)  = 0.0;
        S_psinv                     = diag(S_psinv_diag);
        
        %Calculamos gamma = V Sigma^+ U^T g^n:
        gamma                       = V*(S_psinv*(transpose(U)*g_k));
        
        %#Pr'oximo paso. Aplicamos f'ormula multisecante:
        %   pn  = - H g^n = - [I + (X-G) (G^T G)^{-1} G^T] g^n 
        %       = -g^n - X*gamma + G*gamma,
        p_k                         = -g_k - Xm*gamma + Gm*gamma;
        
    end
    
end

