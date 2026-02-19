function A = SL_MatrizDispersa1(N)

    %Filas intermedias:
    iv      = 2:N-1;
    Deltaiv = ceil((N-iv).*(iv-1)/(N-1));

    %Montamos matriz:
    filasv  = cat(2, 1, iv, iv, iv, N);
    colsv   = cat(2, 1, iv-Deltaiv, iv, iv+Deltaiv, N);
    valsv   = cat(2, 1, repmat(-3, 1, N-2), repmat(7, 1, N-2), repmat(-4, 1, N-2), 1);
    A       = sparse(filasv, colsv, valsv, N, N);
    
end