function [f,J] = Polin_residuo(x, CalcJ)    

    %N'umero de variables:
    N           = length(??);
    
    %T'ermino S=sum_k x_k^2:
    S           = sum(???);
    
    %Residuo:
    f           = zeros(??);
    for ii=1:N
        f(ii)   = (S+ii)*(???);
    end
    
    %Jacobiano, si es necesario:
    if CalcJ
        J                   = zeros(???);
        %df_i/dx_j = 2*x_j*(x_i-1) + S_i*delta_ij
        for ii=1:N
            for jj=1:N
                J(ii,jj)    = 2*x(jj)*(???) + (???)*(ii==jj);
            end
        end
    else
        J       = ???;
    end
    
end
