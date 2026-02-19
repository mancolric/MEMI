%[x_k, nIters, flag] = NewtonRaphson1(fun, x0, Tol, MaxIter)
function [x_k, nIters, flag] = NewtonRaphson1(fun, x0, Tol, MaxIter)
    %Nota: fun es una funci'on de la forma [f,J]=fun(x,CalcJ), que
    %calcula el Jacobiano si CalcJ=true, y que devuelve J=NaN en caso
    %contrario.

    %Comprobamos que x0 es vector columna:
    if size(x0,2)>1
        error('???')
    end
    
    %Dimensi'on del sistema:
    N           = size(???);
        
    %Primera iteraci'on:
    nIters      = ???;
    x_k         = ???;

    %Iteramos:
    while true

        %Evaluamos residuo, Jacobiano y paso:
        [f_k,J_k]   = ???;
        p_k         = ???;
        
        %Salimos si el paso es peque'no:
        if norm(???)<=???
            flag    = ???;
            break
        end

        %Salimos si el m'aximo de iteraciones se ha alcanzado:
        if ???==MaxIter
            flag   = ???;
            break
        end
        
        %Siguiente iteraci'on:
        nIters      = ???;
        x_k         = ???;

    end
    
end

