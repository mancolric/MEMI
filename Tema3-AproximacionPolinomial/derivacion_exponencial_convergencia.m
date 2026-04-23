function derivacion_exponencial_convergencia(N)

    %Recorremos varios h:
%     hv      = logspace(-1, -2, 10);
    hv      = logspace(-1,-10, 20);
    errv    = zeros(size(hv));
    for ii=1:length(hv)
        h           = hv(ii);
        errv(ii)    = derivacion_exponencial(h, N);
    end
    
    %Representamos soluci'on:
    figure()
    loglog(hv, errv, '.-b')
    grid('on')
    
    %Orden de convergencia experimental:
    EOCv    = diff(log(errv))./diff(log(hv));
    display(EOCv)
    
end
