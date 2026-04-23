function err=derivacion_noregular(h, N)

    %Funci'on a derivar:
    fun     = @(x) abs(x).*x.^3 + log(1+5/3*x);
    xstar   = 0.0;
    dfun_ex = 5/3;
%     display(dfun_ex)
    
    %Derivada num'erica:
    xv      = linspace(-N*h/2, N*h/2, N+1).';
%     xv      = linspace(-N*h, 0, N+1).';
    wv      = ReglaDerivacion1(xv, xstar);
    dfun_num= sum(fun(xv).*wv);
%     display(dfun_num)
    
    %Error relativo en la derivada:
    err     = abs((dfun_num-dfun_ex)/dfun_ex);
    
end
