function derivacion_noregular_convergencia(N)

    %Recorremos varios h:
%     hv      = [ 1e-1, 1e-2, 1e-3, 1e-4 ].';
    hv      = logspace(-1, -10, 20);
    errv    = zeros(size(hv));
    for ii=1:length(hv)
        h           = hv(ii);
        errv(ii)    = derivacion_noregular(h, N);
    end
    
    %Representamos soluci'on:
    figure()
    loglog(hv, errv, '.-b')
    grid('on')
    
    %Orden de convergencia experimental:
    EOCv    = diff(log(errv))./diff(log(hv));
    display(EOCv)
    
end
