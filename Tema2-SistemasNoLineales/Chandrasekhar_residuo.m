function [f,J] = Chandrasekhar_residuo(H, CalcJ)    %W.J. Leong et al. (CMA2011)
    
    %Parámetro c:
    c       = 0.9;
    
    %N'umero de variables:
    N       = length(H);
    
    %Mallado en coordenada x:
    x       = ((1:N).'-0.5)/N;
    
    %Reservamos memoria:
    f       = zeros(N, 1);
    if CalcJ
        J   = zeros(N, N);
    else
        J   = NaN;
    end
    
    %Calculamos residuo:
    for ii=1:N
        
        %Sumatorio sum_k x_i H_k / (x_i + x_k). Este sumatorio depende
        %del valor de "i"
        S       = sum(x(ii)*H./(x(ii)+x));
        
        %Residuo:
        f(ii)   = H(ii) - (1.0 - c/(2*N)*S)^(-1);
        
        %Jacobiano, si es necesario;
        if CalcJ
            for jj=1:N
                J(ii,jj)    = (ii==jj) - (1-c/(2*N)*S)^(-2)*...
                                            c/(2*N)*...
                                            x(ii)/(x(ii)+x(jj));
            end
        end
        
    end
       
    
end
