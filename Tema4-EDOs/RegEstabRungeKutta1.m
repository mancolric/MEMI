function RegEstabRungeKutta1(metodo, ax, bx, Nx, ay, by, Ny)

    %Coeficientes del m'etodo:
    [A,b,c,s]       = CoefsRK(metodo);
    
    %Mallamos ejes real e imaginario:
    xv              = linspace(ax, bx, Nx);
    yv              = linspace(ay, by, Ny);
    
    %Funci'on de estabilidad. Nota: z=lambda*Deltat
    Xm              = zeros(Nx,Ny); %Matriz con los valores de Re(z)
    Ym              = zeros(Nx,Ny); %Matriz con los valores de Im(z)
    Rm              = zeros(Nx,Ny); %Matriz con los valores de R(z)
    unos            = ones(s,1);
    Im              = eye(s);
    for ii=1:Nx
        for jj=1:Ny
            Xm(ii,jj)   = xv(ii);
            Ym(ii,jj)   = yv(jj);
            z           = xv(ii)+1i*yv(jj);
            aux         = (Im-z*A)\unos;
            Rm(ii,jj)   = abs(1+z*(b.'*aux));
        end
    end
    
    %Pintamos región G<=1:
    figure()
    contourf(Xm, Ym, 1./Rm, [1.0, Inf])
    %Nota: si hacemos contourf(Xm, Ym, Rm, [1.0 Inf]), Matlab pinta en
    %blanco la región para la que |R|<1 (región estable) y en azul la región 
    %para la que |R|>1 (región inestable). Para que sea al revés, 
    %representamos 1/Rm en lugar de Rm.
    colormap('winter')
    grid on
    axis equal
    xlabel('Re(\lambda \Deltat)')
    ylabel('Im(\lambda \Deltat)')
    title(metodo, 'FontWeight', 'normal')
    
    
end

    