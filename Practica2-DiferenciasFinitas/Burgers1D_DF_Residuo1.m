function [f,J] = Burgers1D_DF_Residuo1(xv, epsilon, uv, CalcJ)

    %Distancia entre nodos (OJO! Se supone mallado uniforme):
    Nx          = length(xv);
    hx          = xv(2)-xv(1);
    
    %Reservamos memoria para residuo y Jacobiano:
    f       = zeros(Nx,1);
    if CalcJ
        filas   = [];
        cols    = [];
        vals    = [];
    end
    
    %Puntos interiores:
    for ii=2:Nx-1

        %Imponemos
        %   u_i*(u_(i+1)-u_(i-1))/(2*hx) - ...
        %       epsilon*( u_(i+1)-2*u_(i)+u_(i-1) )/hx^2 = 0
        f(ii)   = uv(ii) * (uv(ii+1) - uv(ii-1))/(2*hx) - ...
                    epsilon*( uv(ii+1)-2*uv(ii)+uv(ii-1) )/hx^2;
        if CalcJ

            %Derivadas de f(I) respecto de...:
            %Nodo central (ii):
            dfI_du_C    = (uv(ii+1)-uv(ii-1))/(2*hx) + 2*epsilon/hx^2;
            %Nodo izquierdo (ii-1)
            dfI_du_L    = -uv(ii)/(2*hx) - epsilon/hx^2;
            %Nodo derecho (ii+1):
            dfI_du_R    = uv(ii)/(2*hx) - epsilon/hx^2;
            
            %Almacenamos derivadas:
            filas   = cat(1, filas, ii, ii, ii);
            cols    = cat(1, cols, ii, ii-1, ii+1);
            vals    = cat(1, vals, dfI_du_C, dfI_du_L, dfI_du_R);

        end

    end
    
    %Frontera izquierda. Imponemos u_1 = 1:
    f(1)        = uv(1) - 1.0;
    if CalcJ
        filas   = cat(1, filas, 1);
        cols    = cat(1, cols, 1);
        vals    = cat(1, vals, 1);
    end

    %Frontera derecha. Imponemos u_Nx = 0:
    f(Nx)       = uv(Nx) - 0.0;
    if CalcJ
        filas   = cat(1, filas, Nx);
        cols    = cat(1, cols, Nx);
        vals    = cat(1, vals, 1);
    end
       
    %Construimos jacobiano:
    if CalcJ
        J       = sparse(filas, cols, vals, Nx, Nx);
    else
        J       = NaN;
    end
    
end
