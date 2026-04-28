%Devuelve vector fila tv=[t_0, t_1, ..., t_n] y matriz 
% ym = [y_0, y_1, ..., y_n], donde y_i = y(t_i) es un vector columna:
function [tv, ym] = RungeKuttaI(fun, t0, y0, metodo, Deltat, tf)

    %Condici'on inicial:
    tn      = XX;
    yn      = y0(:);
    tv      = [tn];
    ym      = [yn];
    
    %Cargamos coeficientes:
    [A,b,c,s]   = CoefsRK(XX);
    
    %Matriz para guardar derivadas:
    fm          = zeros(XX, s);
        
    %Bucle hasta llegar a tf:
    while tn<tf
        
        %Derivada en t^n:
        fm(:,1)     = fun(XX, XX, XX);
        
        %Paso de tiempo:
        tnp1        = tn + XX;
        if tnp1>tf
            tnp1    = XX;
        end
        Deltatn     = tnp1-XX;
        
        %Recorremos etapas:
        for ii=2:s
            %Variables auxiliares:
            t_ii                = tn + XX
            S                   = 0.0;
            for jj=1:ii-1
            	S               = S + XX;
            end
            aux_ii              = yn + Deltatn*S;
            %Resolver:
            [y_ii, ~, flag]     = NewtonRaphson1(@ResiduoFun, yn, 1e-10, 100);
            if flag<0
                warning('NewtonRaphson no ha convergido')
            end
            %Guardar derivada:
            fm(:,ii)            = fun(XX, XX, XX);
        end
             
        %Soluci'on en t^(n+1):
        S           = 0.0;
        for jj=1:s
            S       = S + XX;
        end
        ynp1        = yn + Deltatn*S;
       
        %Guardamos soluci'on:
        tv          = cat(2, tv, XX);
        ym          = cat(2, ym, XX);
        
        %Actualizamos variables:
        tn          = XX;
        yn          = XX;
        
    end
    
    %Funci'on para resolver etapa ii con Newton-Raphson. Se define aqu'i
    %porque no se pueden definir funciones dentro de un bucle for o while.
    %Esta funci'on tiene acceso a las variables t_ii, aux_ii, etc. definidas
    %arriba.
    function [r,J] = ResiduoFun(y, CalcJ)
        
        %Evaluamos derivada y Jacobiano:
        [f,df_dy]   = fun(t_ii, y, CalcJ);
        
        %Funci'on residuo y Jacobiano:        
        r           = XX;
        if CalcJ
            J       = XX;
        else
            J       = NaN;
        end
        
    end
    
end
