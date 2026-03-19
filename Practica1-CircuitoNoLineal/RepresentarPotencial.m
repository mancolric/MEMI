function RepresentarPotencial(NodosCoords, x)

    %N'umero de nodos:
    nNodos          = size(NodosCoords,1);
    
    %Vector con las tensiones:
    Vv              = x(1:nNodos);
    
    figure()
    plot3(NodosCoords(:,1), NodosCoords(:,2), Vv, '.b')
    xlabel('x')
    ylabel('y')
    zlabel('V')
    
end
