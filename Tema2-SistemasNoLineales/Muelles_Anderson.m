function Muelles_Anderson(L, k1, k2, F)

    %Condici'on inicial:
    x0                  = [ L, L, pi/3, pi/3 ].';
    
    %Llamamos al m'etodo de Anderson:
    [x, nIters, flag]   = Anderson1(@(x)Muelles_residuo(x, L, k1, k2, F), ...
                                    x0, 1e-8, 100, 4);
    if flag<0
        error('El metodo no ha convergido')
    end
    
    %Extraemos inc'ognitas:
    r1              = x(1);
    r2              = x(2);
    theta1          = x(3);
    theta2          = x(4);
    
    %Representamos la soluci'on:
    figure()
    %Configuraci'on inicial en rojo:
    plot([0, L*cos(pi/3)], [0, L*sin(pi/3)], '-r')
    hold on
    plot([L, L*cos(pi/3)], [0, L*sin(pi/3)], '-r')
    %Configuraci'on final en azul:
    plot([0, r1*cos(theta1)], [0, r1*sin(theta1)], '-b')
    hold on
    plot([L, r1*cos(theta1)], [0, r1*sin(theta1)], '-b')
    
end
    