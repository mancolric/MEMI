function [xhatQuad,whatQuad] = GaussLegendre1(N)

    %Definimos funci'on residuo:
    function [r,J] = ReglaCuadratura_residuo(u, ComputeJ)
        
        %Extraemos nodos y pesos:
        w       = u(1:N+1);
        x       = u(N+2:2*(N+1));
        
        %Calculamos residuo:
        Pm      = PolyVander1(x, -1.0, 1.0, 2*N+1);
        iv      = (0:2*N+1).';
        r       = Pm.'*w - (1.0-(-1.0).^(iv+1))./(iv+1);
        
        %Calculamos jacobiano:
        if ComputeJ
            J           = zeros(2*N+2, 2*N+2);
            
            %Derivadas respecto a pesos de cuadratura:
            J(:,1:N+1)  = Pm.';
            
            %Derivadas respecto a posici'on de los nodos:
            for ii=1:2*N+1
                J(1+ii,N+2:2*N+2)   = ii*(w.*Pm(:,ii)).';
            end
            
        else
            J           = NaN;
        end
        
    end
    
    %Condici'on inicial:
    wQuad0      = repmat(2.0/(N+1),N+1,1);
    xQuad0      = linspace(-1.0, 1.0, N+1).';
    u0          = cat(1, wQuad0, xQuad0);
    
    %Comprobamos Jacobiano:
%     [r,J]       = ReglaCuadratura_residuo(u0, true);
%     function f = faux(u)
%         [f,~]   = ReglaCuadratura_residuo(u, false);
%     end
%     J2          = JacobianEst(@faux, u0, 1e-6);
%     disp(J-J2)

    %Resolvemos con NR:
    [u, nIters, flag]   = NewtonRaphson1(@ReglaCuadratura_residuo, u0, 1e-10, 100);
    whatQuad            = u(1:N+1);
    xhatQuad            = u(N+2:2*N+2);
    
end