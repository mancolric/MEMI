%Prothero--Robinson:
%   Probar primero con mu=-1, RK4, Deltat=1e-2, tf=20.
%   Probar luego con mu=-1000 y mu=-10^6
%OJO! Llamar a m'etodo impl'icito (terminado en 'I')
function EDOs_ProtheroRobinson_RKI(mu, metodo, Deltat, tf) 

    %Ecuaci'on a integrar:
    function [f, df_dy] = ydot_fun(t, y, CalcJ)
        
        f           = [ mu*(y(1)-sin(t)) + cos(t) ];
        if CalcJ
            df_dy   = [ mu ];
        else
            df_dy   = NaN;
        end
        
    end

    %Soluci'on num'erica:
    tic
    t0          = 0.0;
    y0          = [0.0];
    [tv, ym]    = RungeKuttaI(@ydot_fun, t0, y0, metodo, Deltat, tf);
    toc
    
    %Soluci'on exacta
    function y = ytheor_fun(t) %t puede ser un vector fila
        
        y       = sin(t);
        
    end

    %Representamos soluci'on:
    ym_ex       = ytheor_fun(tv);
    figure()
    plot(tv, ym_ex(1,:), 'b')
    hold on
    plot(tv, ym(1,:), 'c')
    
    %Calculamos error:
    err         = max(abs(ym_ex(1,:)-ym(1,:)));
    display(err)
    
end
