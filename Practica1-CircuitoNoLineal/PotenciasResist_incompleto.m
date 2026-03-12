function Wv=PotenciasResist(ResistNodos, ResistCoefs, x)

    %Reservamos memoria:
    nResist     = size(XX,XX);
    Wv          = zeros(XX,XX);
    for ii=1:nResist
        
        %Nodos de la resistencia:
        NodoA   = XX;
        NodoB   = XX;
        
        %Coeficientes de la resistencia:
        alpha   = XX;
        beta    = XX;
        
        %Intensidad:
        VA      = x(XX);
        VB      = x(XX);
        I       = XX*(VA-VB) + beta*(XX)^3;
        
        %Potencia:
        Wv(ii)  = (VA-VB)*XX;
        
    end
    
end