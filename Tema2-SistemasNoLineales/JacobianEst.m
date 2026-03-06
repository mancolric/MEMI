function J=JacobianEst(fun, x0, delta)

    %Dimensiones del sistema:
    N       = length(x0);
    
    %Calculamos jacobiano por diferencias finitas:
    J       = zeros(N, N);
    f0      = fun(x0);
    for jj=1:N
        %Perturbaci'on:
        xpert       = x0;
        xpert(jj)   = x0(jj)+delta;
        fpert       = fun(xpert);
        %Aplicamos f'ormula para la derivada df/dx = (f(x+h)-f(x))/(h):
        J(:,jj)     = (fpert-f0)/delta;
    end
    
end
    