function udot = Meteorito_fun1(t, u)

    %Constante gravitacional:
    G       = 2.96e-4;
    %Masa de la Tierra:
    Mt      = 3.00e-6;
    %Masa del sol:
    Ms      = 1.0;
    
    %Posiciones y velocidades:
    xt      = u(1);
    yt      = u(2);
    vxt     = u(3);
    vyt     = u(4);
    xm      = u(5);
    ym      = u(6);
    vxm     = u(7);
    vym     = u(8);
    
    %Movimiento Tierra:
    udot    = zeros(8,1);
    udot(1) = vxt;
    udot(2) = vyt;
    udot(3) = -G * Ms * xt / (xt^2 + yt^2)^(3/2);
    udot(4) = -G * Ms * yt / (xt^2 + yt^2)^(3/2);
    
    %Movimiento meteorito:
    udot(5) = vxm;
    udot(6) = vym;
    udot(7) = -G * Ms * xm / (xm^2 + ym^2)^(3/2) - ...
                 G * Mt * (xm-xt) / ( (xm-xt)^2 + (ym-yt)^2 )^(3/2);
    udot(8) = -G * Ms * ym / (xm^2 + ym^2)^(3/2)  - ...
                 G * Mt * (ym-yt) / ( (xm-xt)^2 + (ym-yt)^2 )^(3/2);
            
end