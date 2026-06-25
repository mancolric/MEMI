function [f,J]  = cuerda_residuo1(xv, T, yv, CalcJ)

    %Datos:
    N       = length(xv);
    h       = xv(2)-xv(1);
    
    %Separamos u de omega:
    uv      = yv(1:N);
    omega   = yv(N+1);
    
    %Reservamos espacio:
    f       = zeros(N+1,1);
    if CalcJ
        filas   = [];
        cols    = [];
        vals    = [];
    end
    
    %Imponemos c.c. izquierda:
    f(1)    = yv(1)-0;
    if CalcJ
        filas       = cat(1, filas, 1);
        cols        = cat(1, cols, 1);
        vals        = cat(1, vals, 1);
    end
    
    %Ecuaciones en los nodos centrales:
    for ii=2:N-1
        f(ii)       = omega^2 * uv(ii) + ...
                        T * (uv(ii+1)-2*uv(ii)+uv(ii-1))/h^2;
        if CalcJ
            filas   = cat(1, filas, ii, ii, ii, ii);
            cols    = cat(1, cols, ii-1, ii, ii+1, N+1);
            vals    = cat(1, vals, T/h^2, omega^2-2*T/h^2, T/h^2, 2*omega*uv(ii));
        end
    end

    %Imponemos c.c. derecha:
    f(N)    = yv(N)-0;
    if CalcJ
        filas       = cat(1, filas, N);
        cols        = cat(1, cols, N);
        vals        = cat(1, vals, 1);
    end
    
    %Imponemos int(u^2)=1:
    alphav      = zeros(N,1);
    alphav(1)   = 0.5;
    alphav(2:N) = 1.0;
    alphav(N)   = 0.5;
%     alphav(1)   = 4;
%     alphav(2:N) = 7;
%     alphav(N)   = 5;
    f(N+1)      = h*sum(alphav.*uv.^2) - 1;
    if CalcJ
        filas   = cat(1, filas, repmat(N+1, N, 1));
        cols    = cat(1, cols, (1:N).');
        vals    = cat(1, vals, 2*h*alphav.*uv);
    end
    
    %Forma alternativa de imponer int(u^2)=1:
%     f(N+1)      = h*0.5*uv(1)^2 + h*0.5*uv(N)^2 - 1;
%     if CalcJ
%         filas   = cat(1, filas, N+1, N+1);
%         cols    = cat(1, cols, 1, N);
%         vals    = cat(1, vals, h*uv(1), h*uv(N));
%     end
%     for jj=2:N-1
%         f(N+1)  = f(N+1) + h*uv(jj)^2;
%         if CalcJ
%             filas   = cat(1, filas, N+1);
%             cols    = cat(1, cols, jj);
%             vals    = cat(1, vals, h*2*uv(jj));
%         end
%     end
    
    %Construimos matriz jacobiana:
    if CalcJ
        J       = sparse(filas, cols, vals, N+1, N+1);
    else
        J       = NaN;
    end
    
end
