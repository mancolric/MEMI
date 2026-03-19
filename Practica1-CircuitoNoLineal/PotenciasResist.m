function Wv=PotenciasResist(ResistNodos, ResistCoefs, x)

    %Reservamos memoria:
    nResist     = size(ResistNodos,1);
    Wv          = zeros(nResist,1);
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
        
        %Potencia:
        Wv(ii)  = (VA-VB)*I;
        
    end
    
end