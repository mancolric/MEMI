function Problema1_2025PEP2()

    Deltat      = 1e-3;
    
    %Constante gravitacional:
    G           = 2.96e-4;
    %Radio de la Tierra:
    Rt          = 4.26e-5;
    %Masa de la Tierra:
    Mt          = 3e-6;
    
    %Velocidad si el movimiento es uniforme:
    R0          = 1; 
    v           = 1.0*sqrt(G/R0);
    tf          = 365.25;
    
    %Condiciones iniciales:
    phi0        = 0.0635;
    u0          = [ cos(phi0)
                    sin(phi0)
                    -v*sin(phi0)
                    v*cos(phi0)
                    -3.7
                    -2.4
                    0.0076
                    0.0088];

    %Resolvemos con RK4:
    tic
    [tv, um]    = RungeKuttaE(@Meteorito_fun1, 0.0, u0, 'RK4', Deltat, tf);
    toc
    
    %Trayectorias:
    RepresentarTrayectorias1(Deltat, tv, um)
    
    %Distancia:
    dv      = sqrt( (um(5,:)-um(1,:)).^2 + (um(6,:)-um(2,:)).^2 );
    figure()
    semilogy(tv, dv, 'b')
    hold on
    semilogy(tv, repmat(Rt, 1, length(tv)), '--k')
    xlabel('t')
    ylabel('d')
    disp(min(dv))
    
end
