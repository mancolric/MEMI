%Crecimiento de una llama en una cerilla.
function EDOs_cerilla_RKAdI(delta, metodo, Tol) 

    %Datos:
    y0          = delta;
    tf          = 2/delta;
    
    %Ecuaci'on a integrar:
    function [ydot, dydot_dy] = ydot_fun(t, y, CalcJ)
        
        ydot    = y^2 - y^3;
        if CalcJ
            dydot_dy    = 2*y - 3*y^2;
        else
            dydot_dy    = NaN;
        end
        
    end

    %Exact solution:
    function y = ytheorfun(t)
        a       = 1/delta -1 ;
        y       = 1.0./(1.0+lambertw(a*exp(a-t)));
    end

    %Soluci'on num'erica:
    tic
    [tv, ym]    = RungeKuttaAdI(@ydot_fun, 0.0, [y0], metodo, Tol, 1e-6, tf);
    toc
    
    %Representamos soluci'on:
    ym_ex       = ytheorfun(tv);
    figure()
    plot(tv, ym(1,:), 'x-b')
    hold on
    plot(tv, ym_ex(1,:), 'r')
    legend('Numerica', 'Exacta', 'location', 'bestoutside')
    
    %Calculamos error:
    ym_ex       = ytheorfun(tv);
    err         = max(abs(ym_ex(1,:)-ym(1,:)));
    display(err)
    
    %Deltat medio:
    Deltat_medio    = tf/(length(tv)-1);
    display(Deltat_medio)
    
end
