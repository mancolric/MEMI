function g = Muelles_residuo(x, L, k1, k2, F)

    %Extraemos inc'ognitas:
    r1      = x(1);
    r2      = x(2);
    theta1  = x(3);
    theta2  = x(4);
    
    %Residuo:
    f       = zeros(4,1);
    f(1)    = k1*(r1-L)*cos(theta1) - k2*(r2-L)*cos(theta2);
    f(2)    = k1*(r1-L)*sin(theta1) + k2*(r2-L)*sin(theta2) - F;
    f(3)    = r1*sin(theta1) - r2*sin(theta2);
    f(4)    = r1*cos(theta1) + r2*cos(theta2) - L;
    
    %Diagonal de la matriz jacobiana:
    diagJ       = zeros(4,1);
    diagJ(1)    = k1*cos(theta1);
    diagJ(2)    = k2*sin(theta2);
    diagJ(3)    = r1*cos(theta1);
    diagJ(4)    = -r2*sin(theta2);
    
    %Residuo precondicionado:
    g           = diagJ.\f;
    
end

    