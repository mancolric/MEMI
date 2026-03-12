function [f,J]=CircuitoResiduo(NodosCoords, ResistNodos, ResistCoefs, FuentesNodos, ...
    FuentesCoefs, x, CalcJ)

    %N'umero de nodos, resistencias y fuentes:
    nNodos      = size(XX,1);
    nResist     = size(XX,1);
    nFuentes    = size(XX,1);
    
    %Reservamos memoria:
    f           = zeros(XX, 1);
    if CalcJ
        filas       = [];
        cols        = [];
        vals        = [];
    end
    
    %Recorremos resistencias:
    for ii=1:nResist
        
        %Nodos de la resistencia:
        NodoA   = XX;
        NodoB   = XX;
        
        %Coeficientes de la resistencia:
        alpha   = XX;
        beta    = XX;
        
        %Tensiones en los nodos A y B:
        VA      = x(XX);     
        VB      = x(XX);
        
        %Intensidad:
        I       = XX;
        
        %Contribuciones de la intensidad en NodoA y NodoB. Notemos que la I
        %sale del nodo A (contribuci'on positiva a la ecuaci'on) y entra en
        %el nodo B (contribuci'on negativa):
        f(NodoA)    = f(NodoA) +- XX;
        f(NodoB)    = f(NodoB) +- XX;
       
        %Calculamos jacobiano:
        if CalcJ
            dI_dVA  = XX; %Derivada de I respecto de VA
            dI_dVB  = XX; %Derivada de I respecto de VB
            filas   = cat(1, filas, NodoA, NodoA, NodoB, NodoB);
            cols    = cat(1, cols, XX, XX, XX, XX);
            vals    = cat(1, vals, XX, XX, XX, XX); 
        end
        
    end
    
    %Contribuciones de las fuentes de tensión:
    for ii=1:nFuentes
        
        %Nodos de la fuente:
        NodoA           = XX;
        NodoB           = XX;
        
        %Intensidad que circula por la fuente:
        I               = x(XX);
        
        %Contribuci'on de la fuente a las intensidades en NodoA y NodoB.
        %Notemos que I sale del nodo A y entra en el nodo B.
        f(NodoA)        = f(NodoA) +- XX;
        f(NodoB)        = f(NodoB) +- XX;
        
        %Imponemos diferencia de potencial entre Nodo A y Nodo B:
        f(nNodos+XX)     = x(XX)-x(XX)-FuentesCoefs(XX);
        
        %Calculamos jacobiano:
        if CalcJ
            filas       = cat(1, filas, NodoA, NodoB, nNodos+XX, nNodos+XX);
            cols        = cat(1, cols, XX, XX, XX, XX);
            vals        = cat(1, vals, XX, XX, XX, XX);
        end
            
    end
    
    %Contribuci'on de la corriente de fuga a tierra. Esta corriente sale
    %del nodo 1:
    I_fuga                  = x(XX);
    f(1)                    = f(1) +- XX;
    %Imponemos tensi'on nula en el nodo 1:
    f(XX)                    = x(XX);
    if CalcJ
        filas               = cat(1, filas, 1, XX);
        cols                = cat(1, cols, XX, XX);
        vals                = cat(1, vals, XX, XX);
    end
    
    %Construimos jacobiano:
    if CalcJ
        J       = sparse(XX, XX, XX, XX, XX);
    else
        J       = NaN;
    end
    
end
