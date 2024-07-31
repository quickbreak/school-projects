{var a,b,x:real;
i,n:integer;
s:real;
function f1(x:real):real;
begin
  f1:=sin(x);
end;
function f2(x:real):real;
begin
  f2:=2*sin(x/2);
end;

begin
  a:=0;
  b:=2*pi;
  write('n=');readln(n);
  s:=0;
  for i:=1 to n do
    s:=s+(b-a)/n*
    abs(f1(a+(2*i-1)*(b-a)/(2*n))-
    f2(a+(2*i-1)*(b-a)/(2*n)));
  write(s:0:8);
  //readln;
end.}

{var a,b,x:real;
i,n:integer;
s:real;
function f1(x:real):real;
begin
  f1:=abs(x*x-4*x);
end;
function f2(x:real):real;
begin
  f2:=-3;
end;

begin
  a:=-1;
  b:=6;
  write('n=');readln(n);
  s:=0;
  for i:=1 to n do
    s:=s+(b-a)/n*
    abs(f1(a+(2*i-1)*(b-a)/(2*n))-
    f2(a+(2*i-1)*(b-a)/(2*n)));
  write(s:0:8);
  //readln;
end.}

var a,b,x:real;
i,n:integer;
s:real;
function f1(x:real):real;
begin
  f1:=(3/7)*x+2/7;
end;
function f2(x:real):real;
begin
  if x>-1 then
  f2:=x-2
  else
  f2:=-x-4;
end;

begin
  a:=-3;
  b:=4;
  write('n=');readln(n);
  s:=0;
  for i:=1 to n do
    s:=s+(b-a)/n*
    abs(f1(a+(2*i-1)*(b-a)/(2*n))-
    f2(a+(2*i-1)*(b-a)/(2*n)));
  write(s:0:8);
  //readln;
end.