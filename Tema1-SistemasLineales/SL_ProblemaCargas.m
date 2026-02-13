function SL_ProblemaCargas(lambda, N)
    
    %Posiciones de las cargas:
    xv      = linspace(0.1, 0.9, N);
    
    %Definimos matriz:
    A       = zeros(N,N);
    for ii=1:N
        for jj=[1:ii-1,ii+1:N]
            x_ij        = xv(ii)-xv(jj);
            A(ii,jj)    = x_ij/abs(x_ij)^3;
        end
    end
    
    %Definimos vector del lado derecho:
    b           = zeros(N,1);
    for ii=1:N
        b(ii)   = -2*lambda*(1/xv(ii) - 1/(1.0-xv(ii)));
    end
    
    %Resolvemos:
    [L,U,P]     = lu(A);
    Q           = U\(L\(P*b));
    
    %Pintamos cargas:
    figure()
    plot(xv, Q, 'x-b')
    
    %Mostramos suma de cargas:
    display(sum(Q))
    
end