function A=transform(A,f)
n=max(size(A));
    for i=1:n
        for j=1:n
            
        p=0;
        
        %Esquina superior izquierda
        
        if i==1 && j==1
             if A(2,1)==A(1,1)
                 p=p+1/2*f;
             end
             
             if A(1,2)==A(1,1)
                 p=p+1/2*f;
             end
        end
        
        %Esquina superior derecha
        
        if i==1 && j==n
             if A(2,n)==A(1,n)
                 p=p+1/2*f;
             end
             
             if A(1,n-1)==A(1,n)
                 p=p+1/2*f;
             end
        end
        
        %Esquina inferior derecha
        
        if i==n && j==n
             if A(n-1,n)==A(n,n)
                 p=p+1/2*f;
             end
             
             if A(n,n-1)==A(n,n)
                 p=p+1/2*f;
             end
        end
        
         %Esquina inferior izquierda
        
        if i==n && j==1
             if A(n-1,1)==A(n,1)
                 p=p+1/2*f;
             end
             
             if A(n,2)==A(n,1)
                 p=p+1/2*f;
             end
        end
        
        %Fila superior
        
        if i==1 && j~=1 && j~=n
             if A(1,j+1)==A(1,j)
                 p=p+1/3*f;
             end
             
             if A(1,j-1)==A(1,j)
                 p=p+1/3*f;
             end
             
             if A(2,j)==A(1,j)
                 p=p+1/3*f;
             end
        end
        
        %Fila inferior
        
        if i==n && j~=1 && j~=n
             if A(n,j+1)==A(n,j)
                 p=p+1/3*f;
             end
             
             if A(n,j-1)==A(n,j)
                 p=p+1/3*f;
             end
             
             if A(n-1,j)==A(n,j)
                 p=p+1/3*f;
             end
        end
        
        %Fila derecha
        
        if j==n && i~=1 && i~=n
             if A(i-1,n)==A(i,n)
                 p=p+1/3*f;
             end
             
             if A(i+1,n)==A(i,n)
                 p=p+1/3*f;
             end
             
             if A(i,n-1)==A(i,n)
                 p=p+1/3*f;
             end
        end
        
        %Fila izquierda
        
        if j==1 && i~=1 && i~=n
             if A(i+1,j)==A(i,j)
                 p=p+1/3*f;
             end
             
             if A(i-1,j)==A(i,j)
                 p=p+1/3*f;
             end
             
             if A(i,j+1)==A(i,j)
                 p=p+1/3*f;
             end
        end
        
       
        %Contenido de la matriz
        
        if i~=1 && j~=1 && i~=n && j~=n
        
            if A(i,j+1)==A(i,j)
            p=p+1/4*f;
            end
            
            if A(i,j-1)==A(i,j)
            p=p+1/4*f;
            end
            
            if A(i+1,j)==A(i,j)
            p=p+1/4*f;
            end
            
            if A(i-1,j+1)==A(i,j)
            p=p+1/4*f;
            end
        end
        
        if rand>p
            A(i,j)=-1*A(i,j);
        end
           A(floor(n/2),floor(n/2))=-1; 
        end
    end
end