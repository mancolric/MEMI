function [udot, J] = TaylorCouette_fun(rv, nu, t, uv, CalcJ)

    %https://farside.ph.utexas.edu/teaching/336L/Fluid/node137.html

    N               = length(rv);
    h               = (rv(end)-rv(1))/(N-1);
    
    udot            = zeros(N,1);
    
    t0              = 0.1;
    udot(1)         = exp(-t/t0)/t0;
    for ii=2:N-1
        udot(ii)    = nu* ( 1/rv(ii)*(uv(ii+1)-uv(ii-1))/(2*h) + ...
                            (uv(ii+1)-2*uv(ii)+uv(ii-1))/h^2 - ...
                            1*uv(ii)/rv(ii)^2 );
    end
    udot(N)        = 0.0;
    
    %Jacobiano:
    if CalcJ
        filas       = [];
        cols        = [];
        vals        = [];
        for ii=2:N-1
            filas       = cat(1, filas, ii, ii, ii);
            cols        = cat(1, cols, ii-1, ii, ii+1);
            vals        = cat(1, vals, nu* (-1/(2*rv(ii)*h) + 1/h^2 ), ...
                                        nu * (-2/h^2 - 1/rv(ii)^2), ...
                                        nu * (1/(2*rv(ii)*h) + 1/h^2 ));
        end
        J           = sparse(filas, cols, vals, N, N);
    else
        J           = NaN;
    end
    
end
