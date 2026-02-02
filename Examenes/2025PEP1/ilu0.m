function [L,U]=ilu0(A)

    %NOTA: Esta función se proporcionaba como dato en el examen. No había
    %que deducirla.
    
    setup.type  = 'nofill';
    [L,U]       = ilu(A, setup);
    
end