function Problema2_2026PEP2()

    %Mallado:
    L       = 5.0;
    N       = 1000;
    xv      = linspace(0.0, L, N).';
    
    %Otros datos:
    g       = 1.0;
    epsilon = 5e-3;
        
    %Condici'on inicial:
    eta0v   = 2.0 - tanh((xv-L/2)/(1e-3*L));
    m0v     = zeros(N, 1);
    y0v     = cat(1, eta0v, m0v);
        
    %Llamamos al RKE:
    Deltat      = 2e-3;
    tf          = 1.0;
    [tv, ym]    = RungeKuttaE(@(t,uv) olas_fun1(t, xv, epsilon, g, uv), ...
                    0.0, y0v, 'RK4', Deltat, tf);
            
    %Animaci'on:
    figure
    for jj=1:length(tv) %jj aquí es jj(enunciado)+1 
        
        %Extraemos soluci'on:        
        etav        = ym(1:N, jj);
        mv          = ym(N+1:2*N, jj);
        
        %Representamos soluci'on:
        plot(xv, etav, 'b')
        hold on
        plot(xv, mv./etav, 'g')
        hold off
        xlabel('x')
        title(['t=',num2str(tv(jj))])
        legend('\eta', 'v')
        
        %Paramos:
        pause(0.01)
        
        %lambda_max*Deltat (a esto se le conoce popularmente como CFL):
        h           = xv(2)-xv(1);
        lambda_max  = max(  max(abs(mv./etav) + sqrt(g*etav))/h, ...
                            epsilon/h^2 );
        CFL         = lambda_max*Deltat;
        display(CFL)
        
        %Desglosamos CFL en términos convectivo y difusivo (no se ped'ia en
        %el enunciado):
        lambdav     = abs(mv./etav) + sqrt(g*etav);
        CFL_lambda  = max(lambdav*Deltat/h);
        CFL_epsilon = epsilon*Deltat/h^2;
        display(CFL_lambda)
        display(CFL_epsilon)
        
    end
            
end