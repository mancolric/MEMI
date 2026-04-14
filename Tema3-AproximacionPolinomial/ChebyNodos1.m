function xv = ChebyNodos1(a,b,N)

    iv      = (0:N).';
    xhatv   = -cos((iv+0.5)/(N+1) * pi);
    xv      = 0.5*(a+b) + 0.5*(b-a)*xhatv;
    
end