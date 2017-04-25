clear;
%load('uglymesh');
geom2;
k = 1;

% nelm=length(t(1,:)) ;
% edof(:,1)=1:nelm  ;
% edof(:,2:4)=t(1:3,:)'; 
% coord=p' ;
% ndof=max(max(t(1:3,:))) ;
% [Ex,Ey]=coordxtr(edof,coord,(1:ndof)',3);
%eldraw2(Ex,Ey,[1,4,1])  ;

K = zeros(ndof);

for i = 1:nelm
    Ke = flw2te(ex(i, :), ey(i, :), 1, k);
    K = assem(edof(i, :), K, Ke);
end

fb = zeros(ndof, 1);
T = solveq(K, fb, bc);
ed = extract(edof, T);
% fill(ex',ey', ed');
extot = [ex ; -ex ; -ex ; ex];
eytot = [ey ; ey ; -ey ; -ey];
edtot = [ed ; ed ; ed ; ed];

fill(extot', eytot', edtot');
