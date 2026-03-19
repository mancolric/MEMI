function [f,J]=CircuitoResiduo(NodosCoords, ResistNodos, ResistCoefs, FuentesNodos, ...
    FuentesCoefs, x, CalcJ)

    %N'umero de nodos, resistencias y fuentes:
    nNodos      = size(NodosCoords,1);
    nResist     = size(ResistNodos,1);
    nFuentes    = size(FuentesNodos,1);
    
    %Reservamos memoria:
    f           = zeros(nNodos+nFuentes+1, 1);
    if CalcJ
        filas       = [];
        cols        = [];
        vals        = [];
    end
    
    %Recorremos resistencias:
    for ii=1:nResist
        
        %Nodos de la resistencia:
        NodoA   = ResistNodos(ii,1);
        NodoB   = ResistNodos(ii,2);
        
        %Coeficientes de la resistencia:
        alpha   = ResistCoefs(ii,1);
        beta    = ResistCoefs(ii,2);
        
        %Intensidad:
        VA      = x(NodoA);
        VB      = x(NodoB);
        I       = alpha*(VA-VB) + beta*(VA-VB)^3;
        
        %Contribuciones de la intensidad en NodoA y NodoB:
        f(NodoA)    = f(NodoA) + I;
        f(NodoB)    = f(NodoB) - I;
       
        %Calculamos jacobiano:
        if CalcJ
            dI_dV   = alpha+3*beta*(VA-VB)^2;
            filas   = cat(1, filas, NodoA, NodoA, NodoB, NodoB);
            cols    = cat(1, cols, NodoA, NodoB, NodoA, NodoB);
            vals    = cat(1, vals, dI_dV, -dI_dV, -dI_dV, dI_dV); 
        end
        
    end
    
    %Contribuciones de las fuentes de tensión:
    for ii=1:nFuentes
        
        %Nodos de la fuente:
        NodoA           = FuentesNodos(ii,1);
        NodoB           = FuentesNodos(ii,2);
        
        %Intensidad que circula por la fuente:
        I               = x(nNodos+ii);
        
        %Contribuci'on de la fuente a las intensidades en NodoA y NodoB:
        f(NodoA)        = f(NodoA) + I;
        f(NodoB)        = f(NodoB) - I;
        
        %Imponemos diferencia de potencial entre n1 y n2:
        f(nNodos+ii)    = x(NodoB)-x(NodoA)-FuentesCoefs(ii);
        
        %Calculamos jacobiano:
        if CalcJ
            filas       = cat(1, filas, NodoA, NodoB, nNodos+ii, nNodos+ii);
            cols        = cat(1, cols, nNodos+ii, nNodos+ii, NodoB, NodoA);
            vals        = cat(1, vals, 1.0, -1.0, 1.0, -1.0);
        end
            
    end
    
    %Contribuci'on de la corriente de fuga a tierra:
    f(1)                    = f(1) + x(nNodos+nFuentes+1);
    f(nNodos+nFuentes+1)    = x(1);
    if CalcJ
        filas               = cat(1, filas, 1, nNodos+nFuentes+1);
        cols                = cat(1, cols, nNodos+nFuentes+1, 1);
        vals                = cat(1, vals, 1.0, 1.0);
    end
    
    %Construimos jacobiano:
    if CalcJ
        J       = sparse(filas, cols, vals, nNodos+nFuentes+1, nNodos+nFuentes+1);
    else
        J       = NaN;
    end
    
end
