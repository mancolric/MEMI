function RepresentarCircuito(NodosCoords, ResistNodos, FuentesNodos)

    %Abrimos figura:
    figure()
    
    %Representar resistencias:
    nR              = size(XX,XX);
    for ii=1:nR
        NodoA                   = XX;
        NodoB                   = XX;
        plot([NodosCoords(XX,XX),NodosCoords(XX,XX)], ...
            [NodosCoords(XX,XX),NodosCoords(XX,XX)], 'o-b')
        hold on
    end
    
    %Representar fuentes:
    nF              = size(XX,XX);
    for ii=1:nF
        NodoA                   = XX;
        NodoB                   = XX;
        plot([NodosCoords(XX,XX),NodosCoords(XX,XX)], ...
            [NodosCoords(XX,XX),NodosCoords(XX,XX)], 's-r')
        hold on
    end
    
    %Se'nalar nodo 1 (conectado a tierra):
    plot(NodosCoords(XX,XX), NodosCoords(XX,XX), 'x-k')
    
end
