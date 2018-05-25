classdef Atlas
  %It keeps an atlas of a surface.
   properties
    %Function of the atlas
    f
    
    %Array for the minimum values of the parametrizations [u1 min, u2
    %min..]
    pmin
    
    %Array for the maximum values of the parametrizations [u1 max, u2
    %max..]
    pmax
    
    %Keeps the dimension of the surface
    Dim
    
   end
   
   methods       
       %Creator-------------------------------------------------------------
       function ct=Atlas(fd,pmind,pmaxd)
          ct.f=fd;
          ct.pmin=pmind;
          ct.pmax=pmaxd;
          ct.Dim=max(size(pmind));
       end
       
       %Parametrization checker---------------------------------------------
       function check=Check(ct,pin)
          
          check=1;
          
          for i=1:max(size(ct.pmin))
              if pin(i)<ct.pmin(i)
                  disp('ERROR: Value of parametrization out of bounds')
                  check=0;
              end
          end
          
          for i=1:max(size(ct.pmax))
              if pin(i)>ct.pmax(i)
                  disp('ERROR: Value of parametrization out of bounds')
                  check=0;
              end
          end
      
      
       end
       
       %Pointer: Points to the vector of value p for the parametrization----
       function v=Point(ct,p)
          
          %Checks if p is out of bounds
          if ct.Check(p)==0
             return
          end
          
          %Returns the pointer
          v=ct.f(p);
              
       end
       
       %Returns a matrix of tangent vectors at the point p------------------
       function TG=Tangent(ct,p)
          
          %Checks if p is out of bounds
          if ct.Check(p)==0
             return
          end
          
          %Defines the value of the precition
          for i=1:ct.Dim
            h(i)=(ct.pmax(i)-ct.pmin(i))*1e-10;
          end
          
          %Redefines if the point to evaluate is an extreme
          for i=1:ct.Dim
            if p(i)==ct.pmax(i)
                p(i)=p(i)-h(i);
            end
          end
          
          %Get the tangent vectors
          for i=1:ct.Dim
            d=zeros(1,ct.Dim);
            d(i)=1;
            TG(i,:)=(ct.Point(p+d.*h)-ct.Point(p))/h(i);
          end
          
       end
       
       %Returns the normal vector for Dim=2---------------------------------
       function n=Normal(ct,p)
          
          %Checks if Dim=2
          if ct.Dim ~=2
            disp('Normal vector only avaible for Dim=2')
            n=nan;
            return
          end
          
          %Checks if p is out of bounds
          if ct.Check(p)==0
             return
          end
          
          %Gets the tangent vectors
           TG=ct.Tangent(p);
      
          %Aplies cross product
          n=cross(TG(1,:),TG(2,:));
          n=n/norm(n);
       end
       
       %Retrns de Metric at the point p-------------------------------------
       function g=G(ct,p)
          
        %Checks if p is out of bounds
          if ct.Check(p)==0
             return
          end
          
        %Gets de Tangent Matrix
        TG=ct.Tangent(p);
          
        %Evaluates the scalar product
        for i=1:ct.Dim
            for j=1:ct.Dim
               g(i,j)=TG(i,:)*TG(j,:)';
            end
        end
          
       end
       
       %Retrns de Curvature Tensor at the point p for Dim=2-----------------
       function l=L(ct,p)
          
          %Checks if p is out of bounds
          if ct.Check(p)==0
             return
          end
          
          %Checks if Dim is equal to 2
          if ct.Dim ~=2
            disp('Curvature Tensor only avaible for Dim=2')
            l=nan;
            return
          end
          
          %Defines the value of the precition
          for i=1:ct.Dim
            h(i)=(ct.pmax(i)-ct.pmin(i))*1e-6;
          end
          
          %Redefines if the point to evaluate is an extreme
          for i=1:ct.Dim
            if p(i)==ct.pmax(i)
                p(i)=p(i)-h(i);
            end
            if p(i)==ct.pmin(i)
                p(i)=p(i)+h(i);
            end
          end
          
          %Takes the normal verctor
          n=ct.Normal(p);
          %Calculus of L
          for i=1:ct.Dim
              for j=1:ct.Dim
                  if i==j
                      d=zeros(1,ct.Dim);
                      d(i)=1;
                      da=(ct.Point(p+d.*h)-2*ct.Point(p)+ct.Point(p-d.*h))/(h(i)^2);
                      l(i,j)=n*da';
                  else
                      di=zeros(1,ct.Dim);
                      di(i)=1;
                      dj=zeros(1,ct.Dim);
                      dj(j)=1;
                      da=(ct.Point(p+di.*h+dj.*h)-ct.Point(p+di.*h-dj.*h)-ct.Point(p-di.*h+dj.*h)+ct.Point(p-di.*h-dj.*h))/(4*h(i)*h(j));
                      l(i,j)=n*da';
                  end
              end
          end
          
          
      
       end
       
       %Retrns de Gauss Curvature at the point p for Dim=2------------------
       function k=KG(ct,p)
          
           %Checks if p is out of bounds
           if ct.Check(p)==0
              return
           end

           %Checks if Dim is equal to 2
           if ct.Dim ~=2
               disp('Gauss Curvature only avaible for Dim=2')
               l=nan;
               return
           end
          
       %Calculate de determinant
       
       k=det(ct.L(p))/det(ct.G(p));
       
       
       end
       
       %Creates a simple plot of the surface for all values of p wuth Dim=2
       function QuickPlot(ct,N)
            

           %Checks if Dim is equal to 2
           if ct.Dim ~=2
               disp('Quick Plot only avaible for Dim=2')
               return
           end

           
           %Creates the plot
           cn1=1;
           cn2=1;
           for i=linspace(ct.pmin(1),ct.pmax(1),N)
               for j=linspace(ct.pmin(2),ct.pmax(2),N)
                    v=ct.Point([i,j]);
                    X(cn1,cn2)=v(1);
                    Y(cn1,cn2)=v(2);
                    Z(cn1,cn2)=v(3);
                    C(cn1,cn2)=ct.KG([i,j]);
                    cn2=cn2+1;
               end
               cn1=cn1+1;
               cn2=1;
           end
           
           surf(X,Y,Z,C,'FaceAlpha',0.7,'EdgeColor','none')
           xlabel('x')
           ylabel('y')
           zlabel('z')

           axis equal
           colorbar
           hold off
       end
       
       %Creates a plot of the surface with the normal vectors  with Dim=2
       function NormalPlot(ct,n)
           %n is an array that keeps the number of vectors to print per
           %coordinate
           N=1000;
           %Checks if Dim is equal to 2
           if ct.Dim ~=2
               disp('Quick Plot only avaible for Dim=2')
               return
           end

           %Creates the normals
           
           for i=1:N
               for j=1:N
                    if i/N*n(1)==floor(i/N*n(1)) && j/N*n(2)==floor(j/N*n(2))
                        p(1)=(i-1)/(N-1)*(ct.pmax(1)-ct.pmin(1))+ct.pmin(1);
                        p(2)=(j-1)/(N-1)*(ct.pmax(2)-ct.pmin(2))+ct.pmin(2);
                        v=ct.Point(p);
                        normal=ct.Normal(p)/2;
                        quiver3(v(1),v(2),v(3),normal(1),normal(2),normal(3),'r')
                        hold on

                    end
               end
           end
           xlabel('x')
           ylabel('y')
           zlabel('z')

           axis equal
           hold off
       end
       
       %Creates a plot of the surface with the tangent vectors  with Dim=2
       function TangentPlot(ct,n)
           %n is an array that keeps the number of vectors to print per
           %coordinate
           N=1000;
           %Checks if Dim is equal to 2
           if ct.Dim ~=2
               disp('Quick Plot only avaible for Dim=2')
               return
           end

           %Creates the tangents
           
           for i=1:N
               for j=1:N
                    if i/N*n(1)==floor(i/N*n(1)) && j/N*n(2)==floor(j/N*n(2))
                        p(1)=(i-1)/(N-1)*(ct.pmax(1)-ct.pmin(1))+ct.pmin(1);
                        p(2)=(j-1)/(N-1)*(ct.pmax(2)-ct.pmin(2))+ct.pmin(2);
                        v=ct.Point(p);
                        TG=ct.Tangent(p);
                        tg1=TG(1,:)/norm(TG(1,:))/2;
                        tg2=TG(2,:)/norm(TG(2,:))/2;
                        quiver3(v(1),v(2),v(3),tg1(1),tg1(2),tg1(3),'b')
                        hold on
                        quiver3(v(1),v(2),v(3),tg2(1),tg2(2),tg2(3),'g')

                    end
               end
           end
           xlabel('x')
           ylabel('y')
           zlabel('z')

           axis equal
           hold off
       end
        
   end
end