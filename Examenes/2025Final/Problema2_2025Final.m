function Problema2_2025Final

    %Datos:
    Nr          = 50;
    rv          = linspace(1.0, 2.0, Nr).';
    nu          = 0.2;
    
    %Llamamos a RK:
    tic
    [tv, um]    = RungeKuttaI(@(t,uv,CalcJ) TaylorCouette_fun1(rv, nu, t, uv, CalcJ), ...
                    0.0, zeros(Nr,1), 'RK4I', 1e-2, 5.0);
    toc
    
    %Error respecto soluci'on te'orica:
    u_ex        = 4./(3*rv) - rv/3;
    eta         = norm(um(:,end)-u_ex,Inf);
    display(eta)
    
    %Animaci'on (no se exig'ia en el examen):
    figure()
    for ii=1:ceil(length(tv)/100):length(tv)
        plot(rv, um(:,ii))
        title(tv(ii))
        pause(0.01)
    end
    hold on
    plot(rv, u_ex, 'xr')
    
    %Comprobamos condici'on de contorno a la izqda (no se exig'ia en el examen):
    figure()
    plot(tv, um(1,:), 'xb', tv, 1-exp(-tv/0.1), 'r')
    xlabel('t')
    ylabel('u_1')
    
    %Gr'aficas:
    t_plot  = [ 0.1, 0.5, 5.0 ];
    figure()
    plot(rv, u_ex, '+k', 'DisplayName', 'Exacta, caso estacionario')
    hold on
    for ii=1:length(t_plot)
        jj      = find(tv>=t_plot(ii), 1, 'first');
        plot(rv, um(:,jj), 'DisplayName', ['t=',num2str(tv(jj))] )
    end
    legend('show', 'location', 'bestoutside')
    
    %Potencia:
    rho     = 1;
    tauv    = rho*nu * ( um(1,:)/1.0  - (um(2,:)-um(1,:))/(rv(2)-rv(1)) );
    Wv      = 2*pi*1.0.*tauv .* 1.0 .* (1.0-exp(-tv/0.1));
    figure()
    plot(tv, Wv)
    hold on
    xlabel('t')
    ylabel('W')
    
end
