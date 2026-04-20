%Masa-muelle-amortiguador:
function EDOs_masa_muelle(metodo, Deltat, tf) 
    %Deltat=0.01, tf=20.0 como primer ejemplo. 
    %Luego dividir Deltat entre 10 y ver cómo el error disminuye.

    %Datos:
    m           = 1.0;
    c           = 0.1;
    k           = 2.0; 
    x0          = 1.0;
    v0          = -1.5;
    
    %Ecuaci'on a integrar:
    function ydot = ydot_fun(t,y)
        
        ydot    = [ ??;
                    ?? ];
        
    end

    %Soluci'on te'orica:
    function y = ytheor_fun(t) %t puede ser un vector fila

        lambda1     = (-c + sqrt(c^2 - 4*m*k))/(2*m);
        lambda2     = (-c - sqrt(c^2 - 4*m*k))/(2*m);
        Cv          = [ 1, 1;  lambda1, lambda2] \ [ x0; v0 ];
        x           = real(Cv(1)*exp(lambda1*t) + Cv(2)*exp(lambda2*t));
        v           = real(Cv(1)*lambda1*exp(lambda1*t) + Cv(2)*lambda2*exp(lambda2*t));
        y           = cat(1, x, v);
        
    end

    %Soluci'on num'erica:
    [tv, ym]    = RungeKuttaE(XX);
    
    %Representamos soluci'on:
    ym_ex       = ytheor_fun(XX);
    figure()
    plot(tv, ym_ex(1,:), '--b')
    hold on
    plot(tv, ym_ex(2,:), '--g')
    plot(tv, XX, 'b')
    plot(tv, XX, 'g')
    xlabel('t')
    legend('x_{ex}', 'v_{ex}', 'x_{num}', 'v_{num}', 'location', 'bestoutside')
    
    %Calculamos errores:
    err_x       = max(abs(XX));
    err_v       = max(abs(XX));
    display(err_x)
    display(err_v)
    
end
