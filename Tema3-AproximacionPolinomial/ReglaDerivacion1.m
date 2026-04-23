function wv=ReglaDerivacion1(xnodos, xstar)

    %Aplicamos cambio de escala:
    a           = xnodos(1);
    b           = xnodos(end);
    xhatnodos   = (xnodos-0.5*(a+b))/(0.5*(b-a));
    xhatstar    = (xstar-0.5*(a+b))/(0.5*(b-a));
    
    %Imponemos que la regla sea exacta para polinomios de grado hasta N:
    %   0               = sum_(j=0)^N 1 * w_j,
    %   i*xstar^(i-1)   = sum_(j=0)^N x_j^i * w_j, i=1,...,N
    N           = length(xnodos)-1;
    Am          = PolyVander1(xhatnodos, -1.0, 1.0, N).';
    iv          = (2:N).';
    bv          = cat(1, 0.0, 1.0, iv.*xhatstar.^(iv-1));
    wv          = Am\bv;            %Pesos para df/dxhat
    wv          = wv*2.0/(b-a);     %Pesos para df/dx
    
end
    