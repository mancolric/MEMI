function ydotv = torbellino_fun1(z, yv, nu)

    %Extraemos variables:
    U           = yv(1);
    Up          = yv(2);
    V           = yv(3);
    Vp          = yv(4);
    w           = yv(5);
    R           = yv(6);
    
    %Derivadas:
    ydotv       = zeros(6,1);
    ydotv(1)    = Up;
    ydotv(2)    = 1/nu*(U^2 - V^2 + w*Up);
    ydotv(3)    = Vp;
    ydotv(4)    = 1/nu*(2*U*V + w*Vp);
    ydotv(5)    = -2*U;
    ydotv(6)    = R*U/w;
    
end

    