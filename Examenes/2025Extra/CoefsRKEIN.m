function [A, Ahat, gamma, b, bhat, c, s] = CoefsRKEIN(metodo)

    switch upper(metodo)
        
        case 'RK3EIN' %Ascher et al ANM1997
            A       = [ 0.0 	0.0 	0.0 	0.0  	0.0;
						1/2 	0.0 	0.0 	0.0  	0.0;
						11/18 	1/18 	0.0 	0.0  	0.0;
						5/6 	-5/6 	1/2 	0.0  	0.0;
                        1/4 	7/4 	3/4 	-7/4  	0.0 ];
            b       = [ 1/4 	7/4 	3/4 	-7/4  	0.0 ].';
            Ahat    = [ 0.0     0.0     0.0     0.0     0.0
                        0.0     1/2     0.0     0.0     0.0
                        0.0     1/6     1/2     0.0     0.0
                        0.0     -1/2    1/2     1/2     0.0
                        0.0     3/2     -3/2    1/2     1/2 ] - A;
            bhat    = [ 0.0     3/2     -3/2    1/2     1/2 ].' - b;
            gamma   = 1/2;
            c       = sum(A,2);
            s       = size(A,1);
        
        otherwise
            error('Metodo desconocido')
    end
    
end


