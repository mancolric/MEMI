function Practica1(C1,C2)
%C1, C2: par'ametros que determinan el tama'no del circuito.

    %Geometr'ia del circuito:
    NodosCoords     = CrearNodos(C1,C2);
    ResistNodos     = CrearResistencias1(C1,C2);
    FuentesNodos    = CrearFuentes1(C1,C2);  
    %Representaci'on:
    RepresentarCircuito(NodosCoords, ResistNodos, FuentesNodos)
    
    %Coeficientes que caracterizan las resistencias y las fuentes:
    ResistCoefs     = CrearResistencias2(C1,C2);
    FuentesCoefs    = CrearFuentes2(C1,C2);

    %Condici'on inicial:
    nN              = size(NodosCoords,1);
    nR              = size(ResistNodos,1);
    nF              = size(FuentesNodos,1);
    x0              = zeros(nN+nF+1,1);

    %Resolvemos con Anderson:
    tic
    [~,J0]          = CircuitoResiduo(NodosCoords, ResistNodos, ResistCoefs, ...
                        FuentesNodos, FuentesCoefs, x0, true);
    [L,U,P,Q]       = lu(J0);
    function g=gfun(x)
        [f,~]           = CircuitoResiduo(NodosCoords, ResistNodos, ResistCoefs, ...
                            FuentesNodos, FuentesCoefs, x, false);
        g               = Q*(U\(L\(P*f)));
    end
    [x,nIters,flag] = Anderson1(@gfun, x0, 1e-8, 100, 10);
    toc
    if flag<0
        warning('El metodo no ha convergido')
    end
    display(nIters)

    %Corriente de fuga:
    I_fuga      = x(end);
    display(I_fuga)

    %Potencias:
    Wv          = PotenciasResist(ResistNodos, ResistCoefs, x);
    Wtotal      = sum(Wv);
    display(Wtotal)
    Wv          = PotenciasFuentes(nN, FuentesNodos, FuentesCoefs, x);
    Wtotal      = sum(Wv);
    display(Wtotal)
    
    %Representar potencial:
    RepresentarPotencial(NodosCoords, x)

end
