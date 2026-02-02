%Devuelve vector fila tv=[t_0, t_1, ..., t_n] y matriz
% ym = [y_0, y_1, ..., y_n], donde y_i = y(t_i) es un vector columna:
function [tv, ym] = RungeKuttaEIN1(fun, t0, y0, metodo, Deltat, tf)

    %Condici'on inicial:
    tn      = t0;
    yn      = y0(:);
    tv      = [tn];
    ym      = [yn];
    
    %Cargamos coeficientes:
    [A, Ahat, gamma, b, bhat, c, s] = CoefsRKEIN(metodo);
    
    %Matrices para guardar derivadas y t'erminos fhat:
    fm          = zeros(length(yn), s);
    fhatm       = zeros(length(yn), s);
        
    %Bucle hasta llegar a tf:
    while tn<tf
        
        %Derivada en t^n y matriz Jacobiana:
        [fm(:,1), Jn]   = fun(tn, yn, true);
        fhatm(:,1)      = Jn*yn;
        
        %Paso de tiempo:
        tnp1            = min(tn + Deltat, tf);
        Deltatn         = tnp1-tn;
        
        %Matriz del sistema y factorizaci'on de la misma:
        An              = eye(length(yn))-Deltatn*gamma*Jn;
        [L,U,P]         = lu(An);
        
        %Recorremos etapas:
        for ii=2:s
            
            %Variables auxiliares:
            t_ii                = tn + c(ii)*Deltatn;
            S                   = 0.0;
            for jj=1:ii-1
            	S               = S + fm(:,jj)*A(ii,jj) + fhatm(:,jj)*Ahat(ii,jj);
            end
            z_ii                = yn + Deltatn*S;
            
            %Resolver:
            y_ii                = U\(L\(P*z_ii));
            %NOTA: Si no se ha hallado la factorizaci'on, se puede hacer
            %simplemente
%             y_ii                = (eye(length(yn)) - Deltatn*gamma*Jn)\z_ii;
            %aunque es un poco m'as lento.
            
            %Guardar derivada y fhat:
            fm(:,ii)            = fun(t_ii, y_ii, false);
            fhatm(:,ii)         = Jn*y_ii;
        end
             
        %Soluci'on en t^(n+1):
        S           = 0.0;
        for jj=1:s
            S       = S + fm(:,jj)*b(jj) + fhatm(:,jj)*bhat(jj);
        end
        ynp1        = yn + Deltatn*S;
       
        %Guardamos soluci'on:
        tv          = cat(2, tv, tnp1);
        ym          = cat(2, ym, ynp1);
        
        %Actualizamos variables:
        tn          = tnp1;
        yn          = ynp1;
        
    end
    
end

