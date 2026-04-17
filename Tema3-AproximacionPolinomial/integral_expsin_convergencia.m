function integral_expsin_convergencia(N)

    %Damos varios valores al n'umero de trozos:
    nTrozosv    = [ 4, 8, 16, 32, 64 ].';
    errv        = zeros(size(nTrozosv));
    hv          = zeros(size(nTrozosv));
    for ii=1:length(nTrozosv)
        nTrozos             = nTrozosv(ii);
        [errv(ii), hv(ii)]  = integral_expsin(nTrozos, N);
    end
    
    %Representamos soluci'on:
    figure()
    loglog(hv, errv, '.-b')
    xlabel('h')
    ylabel('error')
    grid('on')
    
    %Orden de convergencia experimental, es decir, pendiente de la gráfica
    %err-h en escala logarítmica. Debe ser al menos N+1 cuando h -> 0.
    EOCv    = diff(log(errv))./diff(log(hv));
    display(EOCv)
    
end
