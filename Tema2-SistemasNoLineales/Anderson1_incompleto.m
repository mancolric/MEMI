%[x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)
%
function [x_k, nIters, flag] = Anderson1(gfun, x0, Tol, MaxIter, M)

    %Comprobamos que x0 es vector columna:
    if size(x0,2)>1
        error('????')
    end
    %Aseguramos que M<=N
    N           = ???;
    M           = min(??, ??); 
    
    %Primera iteraci'on:
    nIters      = ??;
    x_k         = ??;                   %soluci'on
    g_k         = ??;            %residuo precondicionado    
    p_k         = ??;                 %paso
    Xm          = ??;           %matrices con info 'ultimos pasos
    Gm          = ??;
    while true

        %Salimos del bucle:
        if norm(p_k)<=???
            flag    = ???;
            break
        elseif nIters==???
            flag   = ???;
            break
        end

        %Actualizamos x_nm1 y g_nm1:
        x_km1       = ???;
        g_km1       = ???;
        
        %Actualizamos x_n y g_n:
        nIters      = ???
        x_k         = ???
        g_k         = ???
        
        %Actualizamos matrices X y G:
        Deltag_norm = norm(???) + 1e-12;
        Xm(:,2:M)   = ???;
        Xm(:,1)     = ???/Deltag_norm;
        Gm(:,2:M)   = ???
        Gm(:,1)     = ???/Deltag_norm;
        
        %Factorizaci'on en valores singulares de G:
        [U,S,V]                     = svd(???,0);   %S=Sigma
        
        %Pseudoinversa de S:
        S_diag                      = diag(???);
        S_psinv_diag                = 1.0./???;
        S_psinv_diag(S_diag<???)    = ???;
        S_psinv                     = diag(???);
        
        %Calculamos gamma = V Sigma^+ U^T g^n:
        gamma                       = ???;
        
        %#Pr'oximo paso. Aplicamos f'ormula multisecante:
        %   pn  = - H g^n = - [I + (X-G) (G^T G)^{-1} G^T] g^n 
        %       = -g^n - X*gamma + G*gamma,
        p_k                         = ???;
        
    end
    
end

