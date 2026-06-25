function Problema2_2026Final

    %Datos:
    nu          = 0.04;
    rho         = 0.9;
    
    %Condiciones iniciales:
    y0          = [ 0, 2.5, 1, -3.25, -2e-3, 1 ];
    
    %Llamamos al RK4:
    Deltaz      = 1e-2;
    zfin        = 3.0;
    [zv, ym]    = RungeKuttaE(@(z,y) torbellino_fun1(z,y,nu), 0.0, y0, 'RK4', Deltaz, zfin);
    hv          = zfin-zv;
    Uv          = ym(1,:);  %U(z)
    Upv         = ym(2,:);  %U'(z)
    Vv          = ym(3,:);  %V(z)
    Vpv         = ym(4,:);  %V'(z)
    wv          = ym(5,:);  %w(z)
    Rv          = ym(6,:);  %R(z)
    
    %Representamos radio del torbellino:
    figure()
    plot(Rv, hv, 'b')
    xlabel('R')
    ylabel('z')
    
    %Representamos presi'on:
    pv          = -rho * (nu*Uv + 0.5*wv.^2);
    figure()
    plot(pv, hv, 'b')
    xlabel('p')
    ylabel('z')
    
    %Momento cin'etico por unidad de masa:
    rv          = linspace(0.0, Rv(end), 100);
    lv          = rv.^2 .* Vv(end);
    figure()
    plot(rv, lv, 'b')
    xlabel('r')
    ylabel('l')
    
end