var x,y:real;
ans,ras,x1,y1, x2, y2, p:real;
begin
ans:=0;
x:=0;
p:=sin(6*x);
x1:=p*cos(x);
y1:=p*sin(x);
while x<2*pi do
begin
x:=x+0.0001;
p:=sin(6*x);
x2:=p*cos(x);
y2:=p*sin(x);
ras:=sqrt(sqr(x2-x1)+sqr(y2-y1));
ans:=ans+ras;
x1:=x2;
y1:=y2;
end;
write(ans:0:20); 
end.