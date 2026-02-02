function Problema2_2025Extra(N)

    %Definimos mallado:
    xaux    = linspace(0, 1.0, N+1).';
    xv      = 0.5*(xaux(1:end-1)+xaux(2:end));
    
    %Definimos par'ametros:
    lambda  = 10;
    
    %Condici'on inicial:
    uv0     = zeros(N,1);
    
    %Resolvemos con Newton:
    [uv, nIters, flag]   = NewtonRaphson1(@(u,CalcJ) AlaTorbellino1(lambda, xv, u, CalcJ), ...
        uv0, 1e-8, 100);
    display(nIters)
    if flag<0
        warning('El metodo no ha convergido')
    end
    
    %Gr'afica:
    figure()
    plot(xv, uv, '-b')
    xlabel('x')
    ylabel('u')
    
    %Desplazamiento m'aximo:
    umax    = max(abs(uv));
    display(umax)
    
    return
    
end