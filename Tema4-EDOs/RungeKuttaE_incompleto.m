%Devuelve vector fila tv=[t_0, t_1, ..., t_n] y matriz 
% ym = [y_0, y_1, ..., y_n], donde y_i = y(t_i) es un vector columna
% fun es una función de la forma f = fun(t, y)
function [tv, ym] = RungeKuttaE(fun, t0, y0, metodo, Deltat, tf)

    %Condici'on inicial:
    tn      = XX;
    yn      = y0(:);
    tv      = [tn];
    ym      = [yn];
    
    %Cargamos coeficientes:
    [A,b,c,s]   = CoefsRK(XX);
    
    %Matriz para guardar derivadas en las etapas intermedias:
    fm          = zeros(XX, s);
    
    %Bucle hasta llegar a tf:
    while tn<tf
        
        %Derivada en t^n:
        fm(:,1)     = fun(XX, XX);
        
        %Paso de tiempo:
        tnp1        = tn + XX;
        if tnp1>tf
            tnp1    = XX;
        end
        Deltatn     = tnp1-XX;
        
        %Recorremos etapas:
        for ii=2:s
            t_ii        = tn + XX
            S           = 0.0;
            for jj=1:ii-1
                S       = S + XX
            end
            y_ii        = yn + Deltatn*S;
            fm(:,ii)    = fun(XX, XX);
        end
                
        %Soluci'on en t^(n+1):
        S           = 0.0;
        for jj=1:s
            S       = S + XX
        end
        ynp1        = yn + Deltatn*S;
       
        %Guardamos soluci'on:
        tv          = cat(2, tv, XX);
        ym          = cat(2, ym, XX);
        
        %Actualizamos variables:
        tn          = XX;
        yn          = XX;
        
    end
    
end
