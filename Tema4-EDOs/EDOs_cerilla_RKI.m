%Crecimiento de una llama en una cerilla.
function EDOs_cerilla_RKI(delta, metodo, Deltat) 

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
    [tv, ym]    = RungeKuttaI(@ydot_fun, 0.0, [y0], metodo, Deltat, tf);
    toc
    
    %Representamos soluci'on:
    ym_ex       = ytheorfun(tv);
    figure()
    plot(tv, ym(1,:), 'xb')
    hold on
    plot(tv, ym_ex(1,:), 'r')
    legend('Numerica', 'Exacta', 'location', 'bestoutside')
    
    %Calculamos error:
    ym_ex       = ytheorfun(tv);
    err         = max(abs(ym_ex(1,:)-ym(1,:)));
    display(err)
    
end
