function EDOs_Blasius()

    %----------------------------------------------------------------------
    %DATOS Y FUNCIONES AUXILIARES:
    
    %Corriente incidente:
    U               = 1.2;
    nu              = 0.01;
    
    %Funci'on con la ecuaci'on diferencial. Nota: definimos F=[f, f', f'']:
    function dF_deta = BlasiusFun(eta, F)
        dF_deta     = [ F(2); F(3); -0.5*F(1)*F(3) ];
    end

    %Funci'on que, recibida f''(0), devuelve la soluci'on del EDO,
    %integrada como se pide en el enunciado:
    function [etav, Fm] = BlasiusRK(fpp0)
        F0          = [ 0.0; 0.0; fpp0 ];
        [etav, Fm]  = RungeKuttaE(@BlasiusFun, 0.0, F0, 'RK4', 1e-2, 10.0);
    end
    
    %----------------------------------------------------------------------
    %RESOLUCI'ON POR ANDERSON:
    
    %Funci'on residuo sin precondicionar:
    function r = rfun(fpp0)
        [~, Fm]     = BlasiusRK(fpp0);
        r           = Fm(2,end)-1.0;
    end

    %Representamos r(f0'') en el intervalo (0, 0.8). NO SE PIDE EN EL ENUNCIADO, 
    %pero se incluye aquí a modo ilustrativo para justificar la aproximación
    %   dr/df_0'' ~ (r(0.8)-r(0))/0.8
    figure()
    f0ppv   = linspace(0, 0.8, 20);
    rv      = zeros(size(f0ppv));
    for ii=1:length(f0ppv)
        rv(ii)  = rfun(f0ppv(ii));
    end
    plot(f0ppv, rv)
    xlabel('f_0''''')
    ylabel('r')
    drawnow %para que matlab dibuje las gr'aficas antes de seguir
    
    %Definimos residuo precondicionado:
    dr_dfpp0        = (rfun(0.8)-rfun(0.0))/0.8;
    function g = gfun(fpp0)
        g           = rfun(fpp0)/dr_dfpp0;
    end
    
    %Llamamos al m'etodo de Anderson. S'olo se puede imponer una condici'on
    %secante porque s'olo hay una inc'ognita:
    [fpp0, ~, flag] = Anderson1(@gfun, 0.8, 1e-10, 100, 1);
    if flag<0
        warning('Anderson no ha convergido')
    end
    
    %----------------------------------------------------------------------
    %REPRESENTACI'ON DE LA SOLUCI'ON:
    
    %Hallamos la soluci'on para el valor de fpp0 encontrado:
    [etav, Fm]      = BlasiusRK(fpp0);
    
    %Animaci'on con la evoluci'on de la capa l'imite:
    nPlot           = 100;
    xPlotv          = linspace(0.01, 1.5, nPlot); 
    figure()
    for ii=1:nPlot
        %Valor de x:
        x           = xPlotv(ii);
        %Valores de y = eta/sqrt(U/(nu*x))
        yv          = etav/sqrt(U/(nu*x));
        %Valores de u = U * f'
        uv          = U*Fm(2,:);
        %Dibujo:
        plot(uv, yv, 'b')
        xlabel('u')
        ylabel('y')
        title(sprintf('x=%.2f', x))
        ylim([0,1.4])
        pause(0.1)
    end
    
end
