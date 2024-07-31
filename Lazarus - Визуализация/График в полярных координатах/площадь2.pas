var x,y,r:real;     
    i,n,n_f:longint;
    S, Sf:real;
begin
  randomize;
  //write('r=');readln(r);
  write('n=');read(n);
  n_f:=0;
  S:=8*5;
  //Sf:=;
  for i:=1 to n do
  begin
   // x:=random*2*r-r;     
   // y:=random*2*r-r;
   x:=random;//0<=x<=1  *8
   x*=8;//0<=x<=8 -1
   x-=1;//-1<=x<=7
   y:=random;
   y*=5;
   y-=2; //-2<=y<=3
   //if x*x+y*y<=r*r 
   if (y>=sin(x)) and (y<=2*sin(x/2))
   then n_f:=n_f+1;
  end;
  //write(n_f/n*4*r*r:0:4,pi*r*r:12:4);
  write(n_f/n*S:0:4);
  readln;
end.
{var x,y,r:real;     
    i,n,n_f:longint;
    S, Sf:real;
begin
  randomize;
  //write('r=');read(r);
  write('n=');readln(n);
  n_f:=0;
  S:=7*15;
  //Sf:=;
  for i:=1 to n do
  begin
   // x:=random*2*r-r;     
   // y:=random*2*r-r;
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -1
   x-=1;//-1<=x<=6
   y:=random;
   y*=15;
   y-=3; //-3<=y<=12
   //if x*x+y*y<=r*r 
   if (y>=-3) and (y<=abs(x*x-4*X))
   then n_f:=n_f+1;
  end;
  //write(n_f/n*4*r*r:0:4,pi*r*r:12:4);
  write(n_f/n*S:0:4);
  readln;
end.}
{var x,y,r:real;     
    i,n,n_f:longint;
    S, Sf:real;
begin
  randomize;
  //write('r=');read(r);
  write('n=');readln(n);
  n_f:=0;
  S:=7*5;
  //Sf:=;
  for i:=1 to n do
  begin
   // x:=random*2*r-r;     
   // y:=random*2*r-r;
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -3
   x-=3;//-3<=x<=4
   y:=random;
   y*=5;
   y-=3; //-3<=y<=2
   //if x*x+y*y<=r*r 
   {if (((x>-1) and (y>=x-2)) or ((x<=-1) and (y>=-x-4))) and (y<=3/7*x+2/7)
   then n_f:=n_f+1;
  end;
  //write(n_f/n*4*r*r:0:4,pi*r*r:12:4);
  write(n_f/n*S:0:4);
  readln;//10 ответ
end.}


