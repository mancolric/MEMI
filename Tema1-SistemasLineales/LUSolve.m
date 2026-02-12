function x = LUSolve(L,U,P,b)

    N               = length(b);
    c               = P*b;
    
    %Resolvemos L*y=b:
    y               = zeros(N,1);
    for ii=1:N
        y(ii)       = c(ii);
        for jj=1:ii-1
            y(ii)   = y(ii)-L(ii,jj)*y(jj);
        end
    end
    
    %Resolvemos U*x=y:
    x               = zeros(N,1);
    for ii=N:-1:1
        x(ii)       = y(ii);
        for jj=ii+1:N
            x(ii)   = x(ii)-U(ii,jj)*x(jj);
        end
        x(ii)       = x(ii)/U(ii,ii);
    end
    
end
