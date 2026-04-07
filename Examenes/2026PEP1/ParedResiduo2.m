function [f,J] = ParedResiduo2(u, CalcJ)

    %Datos:
    hconv       = 50.0;
    L           = 0.1;
    T_0         = 400;
    T_inf       = 298;
    k0          = 0.2;
    
    %N'umero de variables:
    N           = length(u)-1;
    Deltax      = L/(N-1);
    
    %Reservamos memoria:
    f           = zeros(N+1, 1);
    filas       = [];
    cols        = [];
    vals        = [];
    
    %Primera ecuaci'on:
    f(1)        = u(1)-T_0;
    if CalcJ
        filas   = cat(1, filas, 1);
        cols    = cat(1, cols, 1);
        vals    = 1.0;
    end
    
    %Ecuaciones intermedias:
    for ii=2:N
        Tmed    = 0.5*(u(ii-1)+u(ii));
        k       = k0*(T_0/Tmed)^2;
        f(ii)   = k*(u(ii)-u(ii-1))/Deltax + u(N+1);
        if CalcJ
            filas   = cat(1, filas, ii, ii, ii);
            cols    = cat(1, cols, ii-1, ii, N+1);
            vals    = cat(1, vals, -k/Deltax, k/Deltax, 1.0);
        end
    end
    
    %'Ultima ecuaci'on:
    f(N+1)          = -hconv*(u(N)-T_inf) + u(N+1);
    if CalcJ
        filas       = cat(1, filas, N+1, N+1);
        cols        = cat(1, cols, N, N+1);
        vals        = cat(1, vals, -hconv, 1.0);
    end
    
    %Montamos matriz Jacobiana:
    if CalcJ
        J           = sparse(filas, cols, vals, N+1, N+1);
    else
        J           = NaN;
    end
    
end
    