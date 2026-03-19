function RepresentarCircuito(NodosCoords, ResistNodos, FuentesNodos)

    %Abrimos figura:
    figure()
    
    %Representar resistencias:
    nR              = size(ResistNodos,1);
    for ii=1:nR
        NodoA                   = ResistNodos(ii,1);
        NodoB                   = ResistNodos(ii,2);
        plot([NodosCoords(NodoA,1),NodosCoords(NodoB,1)], ...
            [NodosCoords(NodoA,2),NodosCoords(NodoB,2)], 'o-b')
        hold on
    end
    
    %Representar fuentes:
    nF              = size(FuentesNodos,1);
    for ii=1:nF
        NodoA                   = FuentesNodos(ii,1);
        NodoB                   = FuentesNodos(ii,2);
        plot([NodosCoords(NodoA,1),NodosCoords(NodoB,1)], ...
            [NodosCoords(NodoA,2),NodosCoords(NodoB,2)], 's-r')
        hold on
    end
    
    %Se'nalar nodo 1 (conectado a tierra):
    plot(NodosCoords(1,1), NodosCoords(1,2), 'x-k')
    
end
