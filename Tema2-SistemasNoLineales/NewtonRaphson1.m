%[x_k, nIters, flag] = NewtonRaphson1(fun, x0, Tol, MaxIter)
function [x_k, nIters, flag] = NewtonRaphson1(fun, x0, Tol, MaxIter)
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

    %Iteramos:
    while true

        %Evaluamos residuo, Jacobiano y paso:
        [f_k,J_k]   = fun(x_k, true);
        p_k         = - (J_k\f_k);
        
        %Salimos si el paso es peque'no:
        if norm(p_k)<=sqrt(N)*Tol
            flag    = 1;
            break
        end

        %Salimos si el m'aximo de iteraciones se ha alcanzado:
        if nIters==MaxIter
            flag   = -1;
            break
        end
        
        %Siguiente iteraci'on:
        nIters      = nIters + 1;
        x_k         = x_k + p_k;

    end
    
end

