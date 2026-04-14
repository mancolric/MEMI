function integral_exp(N)

    %Funci'on a integrar en [-1,1]:
    fun                     = @(x) XX;
    
    %Utilizamos regla de cuadratura:
    [xhatQuad, whatQuad]    = XX;
    I_num                   = sum(XX); 
    display(I_num)
    
    %Valor exacto:
    I_ex                    = exp(1)-exp(-1);
    display(I_ex)
    
    %Error absoluto:
    err                     = abs(XX);
    display(err)
    
end
    