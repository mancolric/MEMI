function SL_LUDispersa(N)

%Filas intermedias:
iv      = 2:N-1;
Deltaiv = ????;

%Montamos matriz:
filasv  = cat(2, 1, ???, ???, ???, N);
colsv   = cat(2, 1, ???, ???, ???, N);
valsv   = cat(2, ???, repmat(???, 1, ???), repmat(???, 1, ???), repmat(???, 1, ???), ???);
A       = sparse(filasv, colsv, valsv, N, N);
x_ast   = rand(N,1);
b       = A*x_ast;

%Factorizaci'on PA=LU:
display('Factorizaci''on LU') %Se recomienda no poner tildes, sino ap'ostrofes
tic
????
toc

%Patr'on de elementos no nulos de PA y L+U:
figure()
spy(???)
title('PA')
figure()
spy(???)
title('L+U (I)')

%Error al resolver con PA=LU:
display('Resoluci''on con LU') 
tic
x           = ????
toc
err         = norm(???,Inf);
display(err)

%Factorizaci'on PAQ=LU:
display('Factorizaci''on LU dispersa')
tic
????
toc

%Patr'on de elementos no nulos de PAQ y L+U:
figure()
spy(???)
title('PAQ')
figure()
spy(???)
title('L+U (II)')

%Resolvemos sistema con PAQ=LU:
display('Resoluci''on con LU dispersa')
tic
x           = ????;
toc
err         = norm(???,Inf);
display(err)


end