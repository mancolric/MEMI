function [xhatQuad, whatQuad]=ChebyQuad1(N)

    %Nodos de cuadratura = nodos de Chebyshev:
    xhatQuad    = ChebyNodos1(-1,1,N);
    
    %Resolvemos sistema
    %   sum_(j=0)^N x_j^i w_j = 1/(i+1)*(1^(i+1)-(-1)^(i+1))
    A           = PolyVander1(xhatQuad, -1, 1, N).';
    iv          = (0:N).';
    b           = (1.^(iv+1)-(-1).^(iv+1))./(iv+1);
    whatQuad    = A\b;
    
end
