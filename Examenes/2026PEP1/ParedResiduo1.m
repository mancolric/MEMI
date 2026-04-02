function [f,J] = ParedResiduo1(u, CalcJ)

    %Datos:
    hconv       = 50.0;
    L           = 0.1;
    T_0         = 400;
    T_inf       = 298;
    k0          = 0.2;
    
    %N'umero de variables:
    N           = length(u)-1;
    Deltax      = L/(N-1);
    
    %Calculamos residuo:
    f           = zeros(N+1, 1);
    f(1)        = u(1)-T_0;
    Tmed        = 0.5*(u(1:N-1)+u(2:N));
    kmed        = k0*(T_0./Tmed).^2;
    f(2:N)      = kmed.*(u(2:N)-u(1:N-1))/Deltax + u(N+1);
    f(N+1)      = -hconv*(u(N)-T_inf) + u(N+1);
    
    %Jacobiana (I):
    if CalcJ
        filas       = [ 1, 2:N, 2:N, 2:N, ...
                        N+1, N+1 ];
        cols        = [ 1, 1:N-1, 2:N, repmat(N+1, 1, N-1), ...
                        N, N+1 ];
        vals        = [ 1, -kmed'/Deltax, kmed'/Deltax, ones(1, N-1), ...
                        -hconv, 1.0 ];
        J           = sparse(filas, cols, vals, N+1, N+1);
    else
        J           = NaN;
    end
    
end
    