function [xQuad, wQuad] = ReglaCuadratura1(N)

    %Nodos de cuadratura = nodos de Chebyshev:
    iv      = (0:N).';
    xQuad   = -cos(iv/N*pi);
    
    %Matriz del sistema:
    A       = zeros(N+1, N+1);
    A(1,:)  = 1.0;
    for ii=1:N
        A(ii+1,:)   = A(ii,:).*(1.0+xQuad.');
    end
    %Otra opci'on es usar:
    %A       = PolyVander1(1.0+xQuad, -1, 1, N).';
    
    %Vector del sistema:
    b       = zeros(N+1, 1);
    alpha   = 0.125;
    for ii=0:N
        b(ii+1)     = 2^(ii+alpha+1)/(ii+alpha+1);
    end
    
    %Pesos de cuadratura:
    wQuad   = A\b;
    
end