function H=WaveValH(r,theta,phy,n,l,m)
%WaveValH is the value of the wave function at the point (r,theta,phy) 
%in spherical coordinates for the quantum numbers n,l,m.
%In general l<=n , -l <= m <= l

    %Errors
    if l>=n || abs(m)>l || n<l
        disp('ERROR: n,l or m must take logical values')
        H=nan;
        return
    end
    if r<0 || phy<0 || phy>2*pi 
        disp('ERROR: r,theta or phy must take logical values')
        disp(r)
        disp(theta)
        disp(phy)
        H=nan;
        return
    end
    %Constants definition
    
        %Electron charge and mass in SI
        qe=-1.602176565e-19;
        me=9.10938291e-31;
        %Proton mass in SI
        mp=1.672621777e-27;
        %Reducted mass
        mu=me*mp/(me+mp);
        %Planck constant/2pi and lightspeed in SI
        hb=1.054571628e-34;
        c=2.99792458e8;
        %Vacuum permittivity 
        eps0=8.854187817e-12;
        
        %Energy at level n
        alpha=qe^2/(hb*c*4*pi*eps0);
        E=-mu*c^2*alpha^2/(n^2)/2;
    
    %Angular depencence normalized:
    
        %N=Normalization factor
            N=sqrt((2*l+1)/4*pi*factorial(l-m)/factorial(l+m));
        %Ylm spherical harmonic of order l,m
            P=legendre(l,cos(theta));
            if m>=0;
             Ylm=(-1^m)*N*exp(1i*m*phy)*P(abs(m)+1);
            else
                phy=phy+pi/2;
             Ylm=(-1^m)*N*exp(1i*m*phy)*P(abs(m)+1);
            end
    
    %Radial dependence:
    
        %ro: Radius normalization
            ro=sqrt(8*mu*abs(E)/(hb*hb))*r;
        %q: Sum limit
            q=n-l-1;
        %Pol: Acumulative polinomial for the radios dependece
            a=linspace(0,0,q);
            a0=hb*hb/(mu*qe^2);
            Pol=a0;
            a(1)=a0*(l+1-n)/(2*l+2);
                for i=1:q
                 Pol=Pol+a(i)*ro^(i);
                 a(i+1)=a(i)*(i+l+1-n)/((i+1)*(i+2+2*l));
                end
        %Pro:Final radius dependence
            Pro=ro^l*exp(-ro/2)*Pol;
            
    %Final result:
    
        H=Ylm*Pro;
   
end
        