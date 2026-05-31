function ydotv = olas_fun1(t, xv, epsilon, g, yv)

    %Datos del mallado:
    N           = length(xv);
    h           = xv(2)-xv(1);
    
    %Separamos eta de m:
    etav        = yv(1:N);
    mv          = yv(N+1:2*N);
    
    %Calculamos derivadas:
    ydotv       = zeros(2*N,1);
    for ii=2:N-1
        
        ydotv(ii)       = - (mv(ii+1)-mv(ii-1))/(2*h) + ...
                            epsilon * (etav(ii+1)-2*etav(ii)+etav(ii-1))/h^2 ;
        ydotv(N+ii)     = - ( ( mv(ii+1)^2/etav(ii+1) + 0.5*g*etav(ii+1)^2 ) - ...
                              ( mv(ii-1)^2/etav(ii-1) + 0.5*g*etav(ii-1)^2 ) ) / (2*h) + ...
                            epsilon * (mv(ii+1)-2*mv(ii)+mv(ii-1))/h^2 ;
                          
    end
    ydotv(N)    = - (mv(N)/etav(N) + sqrt(g*etav(N))) * ...
                        (3*etav(N)-4*etav(N-1)+etav(N-2))/(2*h);
    ydotv(2*N)  = - (mv(N)/etav(N) + sqrt(g*etav(N))) * ...
                        (3*mv(N)-4*mv(N-1)+mv(N-2))/(2*h);
    
end