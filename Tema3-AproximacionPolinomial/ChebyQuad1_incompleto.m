function [xhatQuad, whatQuad]=ChebyQuad1(N)

    %Nodos de cuadratura = nodos de Chebyshev:
    xhatQuad    = ChebyNodos1(XX, XX, XX);
    
    %Resolvemos sistema
    %   sum_(j=0)^N x_j^i w_j = 1/(i+1)*(1^(i+1)-(-1)^(i+1))
    A           = XX(xhatQuad, XX, XX, XX).';
    iv          = (0:N).';
    b           = XX;
    whatQuad    = XX;
    
end
