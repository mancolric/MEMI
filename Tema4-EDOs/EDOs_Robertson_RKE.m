%Probar con RK4, tf = 100
function EDOs_Robertson_RKE(metodo, Deltat, tf) 

    %Ecuaci'on a integrar:
    function ydot = ydot_fun(t,y)
        
        ydot    = [ -0.04*y(1)  + 1e4*y(2)*y(3);
                    +0.04*y(1)  - 1e4*y(2)*y(3)     - 3e7*y(2)*y(2);
                                                    + 3e7*y(2)*y(2) ];
        
    end

    %Soluci'on num'erica:
    tic
    [tv, ym]    = RungeKuttaE(@ydot_fun, 0.0, [1; 0; 0], metodo, Deltat, tf);
    toc
    
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
