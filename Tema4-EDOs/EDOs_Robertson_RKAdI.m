%Probar con RK4I, tf = 100
function EDOs_Robertson_RKAdI(metodo, Tol, tf) 

    %Ecuaci'on a integrar:
    function [ydot, dydot_dy] = ydot_fun(t,y,CalcJ)
        
        ydot            = [ -0.04*y(1)  + 1e4*y(2)*y(3);
                            +0.04*y(1)  - 1e4*y(2)*y(3)     - 3e7*y(2)*y(2);
                                                            + 3e7*y(2)*y(2) ];
        if CalcJ
            dydot_dy    = [ -0.04           +1e4*y(3)               +1e4*y(2);
                            +0.04           -1e4*y(3)-2*3e7*y(2)    -1e4*y(2);
                            0.0             2*3e7*y(2)              0.0         ];
        else
            dydot_dy    = NaN;
        end
        
    end

    %Soluci'on num'erica:
    tic
    [tv, ym]        = RungeKuttaAdI(@ydot_fun, 0.0, [1; 0; 0], metodo, Tol, 1e-6, tf);
    toc
    
    Deltat_medio    = tf/(length(tv)-1);
    display(Deltat_medio)
    
    %Representamos soluci'on:
    figure()
    semilogx(tv, ym(1,:), '-xb')
    title('y_1')
    
    figure()
    semilogx(tv, ym(2,:), '-xg')
    title('y_2')
    
    figure()
    semilogx(tv, ym(3,:), '-xr')
    title('y_3')
    
end
