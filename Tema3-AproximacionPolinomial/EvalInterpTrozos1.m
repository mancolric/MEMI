%peval = InterpTrozos1(C, xtrozos, xeval)
%
%Recibe la matriz de coeficientes C, el vector xtrozos y un vector xeval donde se ha de evaluar 
%el polinomio de interpolación a trozos.
%
%Devuelve un vector peval con los valores del mismo.
function p_eval = EvalInterpTrozos1(C, x_trozos, x_eval)

    %Grado del polinomio de interpolación:
    N       = size(C,1)-1;
    
    %N'umero de trozos:
    nTrozos = length(x_trozos)-1;
    
    %Valores del polinomio de interpolación:
    p_eval  = zeros(size(x_eval));
    for ii=1:numel(x_eval)   %numel = n'umero de elementos, tambi'en valdr'ia length
        
        %Buscamos trozo (orden find):
%         jj          = find(xtrozos(1:nTrozos)<=xeval(ii) & ...
%                             xtrozos(2:nTrozos+1)>=xeval(ii), 1, 'first'); 
        
        %Buscamos trozo (bucle):
        jj          = 0;
        for kk=1:nTrozos
            if x_trozos(kk)<=x_eval(ii) && x_eval(ii)<=x_trozos(kk+1)
                jj  = kk;
                break
            end
        end
        if jj==0
            error('Hay puntos fuera del dominio')
        end
        
        %L'imites del trozo:
        a_j         = x_trozos(jj);
        b_j         = x_trozos(jj+1);
        
        %Evaluamos polinomio:
        p_eval(ii)  = PolyVander1(x_eval(ii), a_j, b_j, N)*C(:,jj);
        
    end
        
end
        
