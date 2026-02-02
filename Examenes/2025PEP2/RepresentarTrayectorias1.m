function RepresentarTrayectorias1(Deltat, tv, um) 

    figure()
    for jj=1:ceil(1/Deltat):length(tv)
        %Sol:
        plot(0, 0, 'or')
        hold on
        %Tierra:
        plot(um(1,:), um(2,:), 'b')
        plot(um(1,jj), um(2,jj), 'ob')
        %Meteorito:
        plot(um(5,:), um(6,:), 'g')
        plot(um(5,jj), um(6,jj), 'og')
        %Etiquetas, etc:
        xlabel('x')
        ylabel('y')
        title(['t=',num2str(tv(jj))])
        axis('equal')
        hold off
        pause(0.01)
    end
    
end
