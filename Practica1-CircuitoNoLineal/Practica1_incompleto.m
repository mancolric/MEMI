function Practica1(C1,C2)
%C1, C2: par'ametros que determinan el tama'no del circuito.

    %Geometr'ia del circuito:
    NodosCoords     = CrearNodos(C1,C2);
    ResistNodos     = CrearResistencias1(C1,C2);
    FuentesNodos    = CrearFuentes1(C1,C2);  
    %Representaci'on:
    XX(NodosCoords, ResistNodos, FuentesNodos)
    
    %Coeficientes que caracterizan las resistencias y las fuentes:
    ResistCoefs     = CrearResistencias2(C1,C2);
    FuentesCoefs    = CrearFuentes2(C1,C2);

    %Condici'on inicial:
    nNodos          = size(NodosCoords,1);
    nResist         = size(ResistNodos,1);
    nFuentes        = size(FuentesNodos,1);
    x0              = zeros(nNodos+nFuentes+1,1);

    %Resolvemos con Anderson:
    tic
    [~,J0]          = CircuitoResiduo(NodosCoords, XX, ResistCoefs, ...
                        XX, FuentesCoefs, XX, XX);
    [XX]            = lu(XX);
    function g=gfun(x)
        [f,~]           = CircuitoResiduo(NodosCoords, XX, ResistCoefs, ...
                        XX, FuentesCoefs, XX, XX);
        g               = XX;
    end
    % [x,nIters,flag] = NewtonRaphson1(@(x,CalcJ) ...
    %                     CircuitoResiduo(NodosCoords, ResistNodos, ResistCoefs, ...
    %                         FuentesNodos, FuentesCoefs, x, CalcJ), ...
    %                     x0, 1e-8, 100);
    % toc
    [x,nIters,flag] = Anderson1(@XXX, XX, XX, XX, XX);
    toc
    if flag<XX
        warning(XX)
    end
    display(XX)     %Mostrar n'umero de iteraciones

    %Corriente de fuga:
    I_fuga      = x(XX);
    display(I_fuga)

    %Potencias:
    Wv          = XX(ResistNodos, ResistCoefs, x);
    Wtotal      = sum(XX);
    display(Wtotal)
    
    %Representar potencial:
    XX(NodosCoords, x)

end
