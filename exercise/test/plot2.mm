with(linalg):;
with(plots):;

plotsetup(maplet);

linfit2:=proc(x,y);
 N:=vectdim(x);
 ones:=vector(N,1);
 A:=augment(ones,x,y);
 R:=evalf(QRdecomp(A));
 B:=matrix(2,2,[R[2,2],R[2,3],R[3,2],R[3,3]]);
 evalf(Svd(B,V,'right'));
 n:=col(V,2);
 c:=-(R[1,2]*n[1]+R[1,3]*n[2])/R[1,1];
 p1:=plot([seq([x[i],y[i]],i=1..N)],style=point,symbol=circle);
 p2:=plot((-n[1]/n[2])*u+(-c/n[2]),u=x[1]..x[N],color='blue');
 p3:=textplot([0,0.5,evalf((-n[1]/n[2]))*x+evalf(-c/n[2])],align={"above","right"});
 plots[display]({p1,p2,p3});
end;

N := 100;
a:=3; b:=2;

x:=vector(N,0): y:=vector(N,0):
for j from 1 by 1 to N do 
  x[j]:=j/N;
  noise:=evalf(rand()/10^12);
  y[j]:=a*x[j]+b+noise();
end do:;

linfit2(x,y);