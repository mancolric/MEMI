function SL_LUDispersa(N)

%Construimos sistema:
A       = SL_MatrizDispersa1(N);
x_ast   = rand(N,1);
b       = A*x_ast;

%Factorizaci'on PA=LU:
display('Factorizaci''on LU') %Se recomienda no poner tildes, sino ap'ostrofes
tic
[L,U,P]     = lu(A);
toc

%Patr'on de elementos no nulos de PA y L+U:
figure()
spy(P*A)
title('PA')
figure()
spy(L+U)
title('L+U (p. parcial)')

%Error al resolver con PA=LU:
display('Resoluci''on con LU') 
tic
x           = U\(L\(P*b));
toc
err         = norm(x-x_ast,Inf);
display(err)

%Factorizaci'on PAQ=LU:
display('Factorizaci''on LU dispersa')
tic
[L,U,P,Q]   = lu(A);
toc

%Patr'on de elementos no nulos de PAQ y L+U:
figure()
spy(P*A*Q)
title('PAQ')
figure()
spy(L+U)
title('L+U (p. total)')

%Resolvemos sistema con PAQ=LU:
display('Resoluci''on con LU dispersa')
tic
x           = Q*(U\(L\(P*b)));
toc
err         = norm(x-x_ast,Inf);
display(err)


end