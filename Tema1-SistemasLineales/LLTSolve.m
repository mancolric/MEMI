function x = LLTSolve(L,b)

    N               = length(b);
    
    %Resolvemos L*y=b:
    y               = zeros(N,1);
    for ii=1:N
        y(ii)       = b(ii);
        for jj=1:ii-1
            y(ii)   = y(ii)-L(ii,jj)*y(jj);
        end
        y(ii)       = y(ii)/L(ii,ii);
    end
    
    %Resolvemos U*x=y, donde U=L^T:
    x               = zeros(N,1);
    for ii=N:-1:1
        x(ii)       = y(ii);
        for jj=ii+1:N
            x(ii)   = x(ii)-L(jj,ii)*x(jj);
        end
        x(ii)       = x(ii)/L(ii,ii);
    end
    
end
