function integral_expsin_convergencia(N)

    %Damos varios valores al n'umero de trozos:
    nTrozosv    = [ 4, 8, 16, 32, 64 ].';
    errv        = zeros(size(XX));
    hv          = zeros(size(XX));
    for ii=1:length(XX)
        nTrozos             = XX;
        [errv(XX), XX]      = integral_expsin(nTrozos, N);
    end
    
    %Representamos soluci'on:
    figure()
    loglog(XX, XX, '.-b')
    xlabel('h')
    ylabel('error')
    grid('on')
    
    %Orden de convergencia experimental, es decir, pendiente de la gráfica
    %err-h en escala logarítmica. Debe ser al menos N+1 cuando h -> 0.
    EOCv    = diff(log(XX))./diff(log(XX));
    display(EOCv)
    
end
