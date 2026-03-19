function V = PolyVander1(x, a, b, N)

    xhat    = (x(:)-0.5*(a+b))/(0.5*(b-a));
    
    V       = zeros(length(xhat), N+1);
    V(:,1)  = 1.0;
    for jj=1:N
        V(:,jj+1)   = V(:,jj).*xhat;
    end
    
end