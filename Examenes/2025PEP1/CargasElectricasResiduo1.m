function [E,J] = CargasElectricasResiduo1(K,lambda,L,Q,x,CalcJ)

    %N'umero de cargas:
    N           = length(Q);
    
    %Residuo y Jacobiano:
    E           = zeros(N,1);
    if CalcJ
        J       = zeros(N, N);
    else
        J       = NaN;
    end
    for ii=1:N
        
        %T'ermino debido a los hilos:
        E(ii)   = 2*K*lambda*(1/x(ii) - 1/(L-x(ii)));
        if CalcJ
            J(ii,ii)        = 2*K*lambda*(-1/x(ii)^2 - 1/(L-x(ii))^2);
        end
        
        %T'ermino debido a las otras cargas:
        for kk=[1:ii-1,ii+1:N]
            r_ik        = abs(x(ii)-x(kk));
            E(ii)       = E(ii) + Q(kk)*K*(x(ii)-x(kk))/r_ik^3;
            if CalcJ
                J(ii,ii)    = J(ii,ii) - Q(kk)*2*K/r_ik^3;
                J(ii,kk)    = Q(kk)*2*K/r_ik^3;
            end
        end
        
    end
        
end
    