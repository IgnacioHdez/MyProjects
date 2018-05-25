function p=fpunt(A)
p=0;
%Calculamos la puntuacion teniendo en cuenta las casillas individuales
for i=1:4
    for j=1:4
        if A(i,j)~=0
        p=((A(i,j)-2)/2)+p;
        end
    end
end
%Calculamos tniendo en cuenta las contiguas
% for i=1:3
%     for j=1:4
%         if A(i,j)==A(i+1,j)
%         p=((A(i,j)-2)/2)+p;
%         end
%     end
% end
% for j=1:3
%     for i=1:4
%         if A(i,j)==A(i,j+1)
%         p=((A(i,j)-2)/2)+p;
%         end
%     end
% end
end