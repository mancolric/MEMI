function [Q,R]=QRFactor(A)

[M,N]       = size(A);

%Inicializamos matrices:
V           = A;            
Q           = zeros(M,N);
R           = zeros(N,N);

%Gram-Schmidt modificado:
for ii=1:N

    %Normalizamos q_i:
    R(ii,ii)    = norm(V(:,ii));
    Q(:,ii)     = V(:,ii)/R(ii,ii);
    
    %Actualizamos vectores v_j:
    for jj=ii+1:N
        %Ahora mismo, v_j es la comp perpendicular de a_j respecto de
        %S_(i-1). Por tanto,
        %   v_j · q_i = a_j · q_i
        R(ii,jj)    = dot(Q(:,ii),V(:,jj));      
        %Actualizamos v_j para que sea la componente ortogonal de a_j sobre
        %S_i:
        V(:,jj)     = V(:,jj) - R(ii,jj)*Q(:,ii); 
    end
    
end
