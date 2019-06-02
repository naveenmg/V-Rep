function theta= invScara(x,y,z)
a=0.525;
b=0.525;
d=0.4099;
s=sqrt(x^2+y^2);
d3= d-z;
cosb=(a^2+s^2-b^2)/(2*a*s);
sinb=sqrt(1-(cosb^2));
cosc=(a^2+b^2-s^2)/(2*a*b);
sinc=sqrt(1-(cosc^2));
d1= atan2(y,x);
d2= (atan2(sinb,cosb));
t1= d1-d2;
t3=(atan2(sinc,cosc));
t2= (pi)-(t3);
theta= [t1 t2 d3];
end
