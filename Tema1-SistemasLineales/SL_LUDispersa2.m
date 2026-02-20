function SL_LUDispersa2(N)

%Inicializamos filas, cols y vals con a11:
filas   = 1;
cols    = 1;
vals    = 1;

%Bucle:
for ii=2:N
    Delta_ii    = ceil(ii/1.5);
    cols_ii     = [ii-Delta_ii:-Delta_ii:1, ii, ii+Delta_ii:Delta_ii:N];
    filas       = cat(2, filas, repmat(ii, 1, length(cols_ii)));
    cols        = cat(2, cols, cols_ii);
    vals        = cat(2, vals, ii+cols_ii);
end

%Construimos matriz y sistema:
A           = sparse(filas, cols, vals, N, N);
x_ast       = rand(N,1);
b           = A*x_ast;

%Factorizaci'on PA=LU:
tic
[L,U,P]     = lu(A);
toc

figure()
spy(A)
title('PA')
figure()
spy(L+U)
title('L+U (I)')
tic
x           = U\(L\(P*b));
toc
disp(norm(x-x_ast, Inf))

%Factorizaci'on PAQ=LU:
tic
[L,U,P,Q]   = lu(A);
toc

figure()
spy(P*A*Q)
title('PAQ')
figure()
spy(L+U)
title('L+U (II)')

tic
x           = Q*(U\(L\(P*b)));
toc
disp(norm(x-x_ast, Inf))


end