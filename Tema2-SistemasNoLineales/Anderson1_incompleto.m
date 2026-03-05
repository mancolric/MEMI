%[x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)
%
function [x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)

    %Comprobamos que x0 es vector columna:
    if size(x0,2)>1
        error(XX)
    end
    %Aseguramos que M<=N
    N           = XX;
    M           = min(XX, XX); 
    
    %Primera iteraci'on:
    nIters      = XX;
    x_k         = XX;                   %soluci'on
    g_k         = XX;            %residuo precondicionado    
    p_k         = XX;                 %paso
    Xm          = XX;           %matrices con info 'ultimos pasos
    Gm          = XX;
    while true

        %Salimos del bucle:
        if norm(p_k)<=XX
            flag    = XX;
            break
        elseif nIters==XX
            flag   = XX;
            break
        end

        %Actualizamos x_nm1 y g_nm1:
        x_km1       = XX;
        g_km1       = XX;
        
        %Actualizamos x_n y g_n:
        nIters      = XX
        x_k         = XX
        g_k         = XX
        
        %Actualizamos matrices X y G:
        Deltag_norm = norm(XX) + 1e-12;
        Xm(:,2:M)   = XX;
        Xm(:,1)     = XX/Deltag_norm;
        Gm(:,2:M)   = XX
        Gm(:,1)     = XX/Deltag_norm;
        
        %Factorizaci'on en valores singulares de G:
        [U,S,V]                     = svd(XX,0);   %S=Sigma
        
        %Pseudoinversa de S:
        S_diag                      = diag(XX);
        S_psinv_diag                = 1.0./XX;
        S_psinv_diag(S_diag<XX)     = XX;
        S_psinv                     = diag(XX);
        
        %Calculamos gamma = V Sigma^+ U^T g^n:
        gamma                       = XX;
        
        %#Pr'oximo paso. Aplicamos f'ormula multisecante:
        %   pn  = - H g^n = - [I + (X-G) (G^T G)^{-1} G^T] g^n 
        %       = -g^n - X*gamma + G*gamma,
        p_k                         = XX;
        
    end
    
end

