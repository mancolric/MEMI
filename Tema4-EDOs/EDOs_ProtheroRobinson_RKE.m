%Prothero--Robinson:
%   Probar primero con mu=-1, RK4, Deltat=1e-2, tf=2.
%   Probar luego con mu=-1000 y mu=-10^6
function EDOs_ProtheroRobinson_RKE(mu, metodo, Deltat, tf) 

    %Datos:
    gfun        = @(t) sin(t);
    gdotfun     = @(t) cos(t);
    y0          = gfun(0.0);
    
    %Ecuaci'on a integrar:
    function ydot = ydot_fun(t,y)
        
        ydot    = [ mu*(y(1)-gfun(t)) + gdotfun(t) ];
        
    end

    %Soluci'on num'erica:
    tic
    [tv, ym]    = RungeKuttaE(@ydot_fun, 0.0, [y0], metodo, Deltat, tf);
    toc
    
    %Representamos soluci'on:
    ym_ex       = gfun(tv);
    figure()
    plot(tv, ym_ex(1,:), 'b')
    hold on
    plot(tv, ym(1,:), 'c')
    
    %Calculamos error:
    ym_ex       = gfun(tv);
    err         = max(abs(ym_ex(1,:)-ym(1,:)));
    display(err)
    
end
