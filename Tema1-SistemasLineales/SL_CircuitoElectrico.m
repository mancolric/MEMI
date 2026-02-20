function SL_CircuitoElectrico(N)

    %Tensión de la fuente y resistencia:
    Vbar        = 2.8;
    R           = 1.5;
    
    %Posici'on de los nodos en coords. polares:
    thetav      = 2*pi/(N-1)*(0:N-1).';     %Trasponemos para que sea vector columna
    thetav      = cat(1, thetav, thetav);
    rv          = cat(1, repmat(1.0, N, 1), repmat(2.0, N, 1));
    
    %Ecs. relacionadas con los nodos 1, N, N+1, 2N:
    filasv      = [ 1, N, N+1, 2*N ];
    colsv       = [ 1, N, N+1, 2*N ];
    valsv       = [ 1, 1, 1, 1 ];
    
    %Recorremos resto de nodos:
    for ii=2:N-1
        
        %Nodo interior:
        filasv  = cat(2, filasv, ii, ii, ii, ii);
        colsv   = cat(2, colsv, ii, ii-1, ii+1, N+ii);
        valsv   = cat(2, valsv, 3*R, -R, -R, -R);
            
        %Nodo exterior:
        filasv  = cat(2, filasv, N+ii, N+ii, N+ii, N+ii);
        colsv   = cat(2, colsv, N+ii, N+ii-1, N+ii+1, ii);
        valsv   = cat(2, valsv, 3*R, -R, -R, -R);
        
    end
    
    %Montamos matriz:
    A           = sparse(filasv, colsv, valsv, 2*N, 2*N);
    
    %Vector del lado derecho:
    b           = zeros(2*N, 1);
    b(N+1)      = Vbar;
    b(2*N)      = Vbar;
    
    %Resolvemos sistema:
    V           = A\b;
    
    %Pintamos tensiones:
    figure()
    plot3(rv.*cos(thetav), rv.*sin(thetav), V, '*b')
    xlabel('x')
    ylabel('y')
    zlabel('V')
    
end
    