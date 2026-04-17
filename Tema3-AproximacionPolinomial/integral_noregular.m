function [err,h] = integral_noregular(nTrozos, N)

    %Funci'on a integrar y l'imites:
    fun     = @(x) abs(x).*x.^3 + cos(x);
    a       = -1.0;
    b       = 2.0;
    I_ex    = 31/5 + sin(2) + sin(1);
%     display(I_ex)
    
    %Integral num'erica:
    xv      = linspace(a, b, nTrozos+1);
    I_num   = Integral1(fun, xv, N);
%     display(I)
    
    %Tamaño de los elementos:
    h       = (b-a)/nTrozos;
    
    %Error relativo en la integral:
    err     = abs((I_num-I_ex)/I_ex);
%     display(err)

end
