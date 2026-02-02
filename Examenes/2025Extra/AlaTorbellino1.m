function [f,J] = AlaTorbellino1(lambda, xv, uv, CalcJ)

    %Funci'on n'ucleo:
    function K = Kfun(x,X)
        if x<=X
            K   = (x^2*X/2-x^3/6);
        else
            K   = (x*X^2/2-X^3/6);
        end
    end

    %Distancia entre nodos y n'umero de nodos:
    h       = xv(2)-xv(1);
    N       = length(uv);
    
    %Residuo f:
    f       = zeros(N,1);
    for ii=1:N
        f(ii)       = uv(ii);
        for jj=1:N
            K_ij        = Kfun(xv(ii), xv(jj));
            f(ii)       = f(ii) - K_ij * lambda * sin(pi*(0.75-xv(jj))) * ...
                                                    1/(1+uv(jj)^2) * h;
        end
    end
    
    %Jacobiano:
    if CalcJ
        J       = zeros(N,N);
        for ii=1:N
            for jj=1:N
                K_ij        = Kfun(xv(ii), xv(jj));
                J(ii,jj)    = K_ij * lambda * h * ...
                                            sin(pi*(0.75-xv(jj))) / ...
                                            (1+uv(jj)^2)^2 * ...
                                            2*uv(jj);
            end
            J(ii,ii)        = J(ii,ii)+1;
        end
    else
        J       = NaN;
    end
    
end