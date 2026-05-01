function [f,J] = Burgers1D_DF_Residuo1(xv, epsilon, uv, CalcJ)

    %Distancia entre nodos (OJO! Se supone mallado uniforme):
    Nx          = length(XX);
    hx          = XX;
    
    %Reservamos memoria para residuo y Jacobiano:
    f       = zeros(XX,1);
    if CalcJ
        filas   = [];
        cols    = [];
        vals    = [];
    end
    
    %Puntos interiores:
    for ii=XX

        %Imponemos
        %   u_i*(u_(i+1)-u_(i-1))/(2*hx) - ...
        %       epsilon*( u_(i+1)-2*u_(i)+u_(i-1) )/hx^2 = 0
        f(XX)   = XX
        if CalcJ

            %Derivadas de f(I) respecto de...:
            %Nodo central (ii):
            dfI_du_C    = XX
            %Nodo izquierdo (ii-1)
            dfI_du_L    = XX
            %Nodo derecho (ii+1):
            dfI_du_R    = XX
            
            %Almacenamos derivadas:
            filas   = cat(1, filas, XX);
            cols    = cat(1, cols, XX);
            vals    = cat(1, vals, XX);

        end

    end
    
    %Frontera izquierda. Imponemos u_1 = 1:
    f(XX)       = XX;
    if CalcJ
        filas   = cat(1, filas, XX);
        cols    = cat(1, cols, XX);
        vals    = cat(1, vals, XX);
    end

    %Frontera derecha. Imponemos u_Nx = 0:
    f(XX)       = XX;
    if CalcJ
        filas   = cat(1, filas, XX);
        cols    = cat(1, cols, XX);
        vals    = cat(1, vals, XX);
    end
       
    %Construimos jacobiano:
    if CalcJ
        J       = sparse(XX);
    else
        J       = NaN;
    end
    
end
