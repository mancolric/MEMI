function [err,h] = integral_expsin_incompleto(nTrozos, N)

    %Funci'on a integrar y l'imites:
    fun     = @(x) XX;
    a       = XX;
    b       = XX;
    I_ex    = 0.5*(1.0-exp(4.0*pi));
    
    %Integral num'erica:
    xv      = linspace(XX);
    I_num   = Integral1(XX, XX, XX);
    
    %Tamaño de los elementos:
    h       = XX;
    
    %Error relativo en la integral:
    err     = abs(XX);
    
end
