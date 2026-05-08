%Devuelve vector fila tv=[t_0, t_1, ..., t_n] y matriz 
% ym = [y_0, y_1, ..., y_n], donde y_i = y(t_i) es un vector columna:
function [tv, ym] = RungeKuttaAdI(fun, t0, y0, metodo, Tol, Deltat0, tf)

    %Condici'on inicial:
    tn      = t0;
    yn      = y0(:);
    tv      = [tn];
    ym      = [yn];
    Deltatn = Deltat0;
    
    %Cargamos coeficientes:
    [A,b,bhat,...
        c,s,orden]  = CoefsRKAd(metodo);
    
    %Matriz para guardar derivadas:
    fm              = zeros(length(yn), s);
        
    %Bucle hasta llegar a tf:
    while tn<tf
        
        %Derivada en t^n:
        fm(:,1)     = fun(tn, yn, false);
        
        %Calcular soluci'on en t^(n+1) hasta que converja:
        while true
            
            %Paso de tiempo:
            tnp1        = tn + Deltatn;
            
            %Recortar paso de tiempo si es necesario:
            if tnp1>tf
                tnp1    = tf;
            end
            Deltatn     = tnp1-tn;

            %Recorremos etapas:
            for ii=2:s
                %Variables auxiliares:
                t_ii                = tn + c(ii)*Deltatn;
                S                   = 0.0;
                for jj=1:ii-1
                    S               = S + fm(:,jj)*A(ii,jj);
                end
                aux_ii              = yn + Deltatn*S;
                %Resolver:
                [y_ii, ~, flag]     = NewtonRaphson1(@ResiduoFun, yn, 0.01*Tol, 100);
                %Salimos del bucle for si no hay convergencia:
                if flag<0
                    break
                end
                %Guardar derivada:
                fm(:,ii)            = fun(t_ii, y_ii, false);
            end

            %Soluci'on en t^(n+1):
            S           = 0.0;
            for jj=1:s
                S       = S + fm(:,jj)*b(jj);
            end
            ynp1        = yn + Deltatn*S;
            
            %Estimaci'on del error:
            en          = 0.0;
            for jj=1:s
                en      = en + fm(:,jj)*(b(jj)-bhat(jj));
            end
            en          = en*Deltatn;
            en          = norm(en,Inf);

            %Ajustar paso de tiempo:
            if flag<0
                %Reducimos paso de tiempo:
                Deltatn     = 0.5*Deltatn;
            elseif en>Tol
                %Reducimos paso de tiempo:
                Deltatn     = Deltatn*max(0.3, (0.9*Tol/en)^(1/orden));
            else
                %Ajustamos paso de tiempo:
                Deltatn     = Deltatn*min((0.9*Tol/en)^(1/orden), 2.0);
                %Aceptamos soluci'on:
                break
            end
       
            %Salir si el paso de tiempo es demasiado peque'no:
            if Deltatn<1e-12
                error('Se ha alcanzado el paso minimo de tiempo')
            end
            
        end
        
        %Guardamos soluci'on:
        tv          = cat(2, tv, tnp1);
        ym          = cat(2, ym, ynp1);
        
        %Actualizamos variables:
        tn          = tnp1;
        yn          = ynp1;
        
    end
    
    %Funci'on para resolver etapa ii con Newton-Raphson. Se define aqu'i
    %porque no se pueden definir funciones dentro de un bucle for o while.
    %Esta funci'on tiene acceso a las variables t_ii, b_ii, etc. definidas
    %arriba.
    function [r,J] = ResiduoFun(y, CalcJ)
        
        %Evaluamos derivada y Jacobiano:
        [f,df_dy]   = fun(t_ii, y, CalcJ);
        
        %Funci'on residuo y Jacobiano:        
        r           = y - aux_ii - Deltatn*A(ii,ii)*f;
        if CalcJ
            J       = speye(length(y)) - Deltatn*A(ii,ii)*df_dy;
        else
            J       = NaN;
        end
        
    end
    
end
