function g = Catenaria_Residuo1(xv, mu, uv)

    %Dimensiones:
    Nx      = length(xv);
    hx      = (xv(end)-xv(1))/(Nx-1);
    
    %Condiciones de contorno:
    uL      = cosh((0-0.2)/mu)*mu;
    uR      = cosh((1-0.2)/mu)*mu;
    
    %Residuo:
    g       = zeros(Nx,1);
    g(1)    = uv(1) - uL;
    for ii=2:Nx-1
        g(ii)   = (uv(ii+1)-2*uv(ii)+uv(ii-1))/hx^2  - ...
                    1/mu * sqrt( 1 + ( (uv(ii+1)-uv(ii-1))/(2*hx) )^2 );
        g(ii)   = g(ii)/(-2/hx^2);
    end
    g(Nx)   = uv(Nx) - uR;
    
end
