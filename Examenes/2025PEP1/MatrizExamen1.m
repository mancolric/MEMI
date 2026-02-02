function A = MatrizExamen1(N)
    
    iv          = 1:N-1;
    alphav      = ceil( (N-iv) .* (0.01+0.49*(1-cos(5*pi*iv/N))) );
    betav       = ceil( (N-iv) .* (0.01+0.49*(1+cos(5*pi*iv/N))) );
    filas       = cat(2, iv+alphav, iv, iv, N);
    cols        = cat(2, iv, iv, iv+betav, N);
    vals        = cat(2, repmat(-1.0, 1, N-1), repmat(12.0, 1, N-1), repmat(-5.0, 1, N-1), 12.0);
    A           = sparse(filas, cols, vals, N, N);
    
end