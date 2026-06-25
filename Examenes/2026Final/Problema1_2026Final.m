function Problema1_2026Final

    %Datos:
    T       = 1.2;
    N       = 1e4;
    
    %Generamos mallado:
    xv      = linspace(0, 1, N).';
    
    %Condici'on inicial:
    uv0     = ones(length(xv),1);
    omega0  = sqrt(T);
    yv0     = cat(1, uv0, omega0);
    
    %Calculamos y factorizamos Jacobiano en x0:
    [f0,J0]             = cuerda_residuo1(xv, T, yv0, true);
    [L,U,P,Q]           = lu(J0);
    
    %Definimos función residuo precondicionado:
    function g=gfun(y)
        [f,~]           = cuerda_residuo1(xv, T, y, false);
        g               = Q*(U\(L\(P*f)));
    end

    %Resolvemos con Anderson:
    [yv, nIters, flag]  = Anderson1(@gfun, yv0, 1e-8, 150, 15);
    if flag<1
        warning('Resolvedor no ha convergido')
    end
    uv                  = yv(1:N);
    omega               = yv(N+1);
    
    %Soluci'on exacta (no se ped'ia en el examen):
    uv_ex               = sin(pi*xv) * sqrt(2);
    omega_ex            = sqrt(T)*pi;
    
    %Mostramos resultado:
    figure()
    plot(xv, uv_ex, 'xr')
    hold on
    plot(xv, uv, 'b')
    xlabel('x')
    ylabel('u')
    %
    display(omega)
    display(omega_ex)
    
end