function [err,h] = integral_expsin(nTrozos, N)

    %Funci'on a integrar y l'imites:
    fun     = @(x) exp(x).*sin(x);
    a       = 0.0;
    b       = 4*pi;
    I_ex    = 0.5*(1.0-exp(4.0*pi));
    
    %Integral num'erica:
    xv      = linspace(a, b, nTrozos+1);
    I_num   = Integral1(fun, xv, N);
    
    %Tamaño de los elementos:
    h       = (b-a)/nTrozos;
    
    %Error relativo en la integral:
    err     = abs((I_num-I_ex)/I_ex);
    
end
