function integral_exp(N)

    %Funci'on a integrar en [-1,1]:
    fun                     = @(x) exp(x);
    
    %Utilizamos regla de cuadratura:
    [xhatQuad, whatQuad]    = ChebyQuad1(N);
    I_num                   = sum(whatQuad .* fun(xhatQuad)); 
    display(I_num)
    
    %Valor exacto:
    I_ex                    = exp(1)-exp(-1);
    display(I_ex)
    
    %Error:
    err                     = abs(I_num-I_ex);
    display(err)
    
end
    