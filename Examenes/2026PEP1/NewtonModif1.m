%[x_k, nIters, flag] = NewtonModif(fun, x0, Tol, MaxIter, K)
function [x_k, nIters, flag] = NewtonModif1(fun, x0, Tol, MaxIter, K)
    %Nota: fun es una funci'on de la forma [f,J]=fun(x,CalcJ), que
    %calcula el Jacobiano si CalcJ=true, y que devuelve J=NaN en caso
    %contrario.

    %Comprobamos que x0 es vector columna:
    if size(x0,2)>1
        error('La condicion inicial debe ser un vector columna')
    end
    
    %Dimensi'on del sistema:
    N           = size(x0,1);
        
    %Primera iteraci'on:
    nIters      = 0;
    x_k         = x0;
    IterJ       = 0;    %cuando nIters=IterJ, se recalcula la jacobiana

    %Iteramos:
    while true

        %Evaluamos residuo, Jacobiano y paso:
        if nIters==IterJ
            [f_k,J_k]   = fun(x_k, true);
            [L,U,P]     = lu(J_k);
            IterJ       = IterJ + K; 
        else
            [f_k,~]     = fun(x_k, false);
        end
        p_k             = - (U\(L\(P*f_k)));
        
        %Salimos si el paso es peque'no:
        if norm(p_k)<=sqrt(N)*Tol
            flag    = 1;
            break
        end

        %Salimos si el m'aximo de iteraciones se ha alcanzado:
        if nIters==MaxIter
            flag    = -1;
            break
        end
        
        %Siguiente iteraci'on:
        nIters      = nIters + 1;
        x_k         = x_k + p_k;

    end
    
end

