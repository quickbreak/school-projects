unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function Sf(n:longint):real;
var x,y,r:real;
    i,n_f:longint;
    S:real;
begin
  randomize;
  n_f:=0;
  S:=7*15;
  for i:=1 to n do
  begin
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -1
   x-=1;//-1<=x<=6
   y:=random;
   y*=15;
   y-=3; //-3<=y<=12
   if (y>=-3) and (y<=abs(x*x-4*X))
   then n_f:=n_f+1;
  end;
  Sf:=n_f/n*S;
end;
procedure Poi(n:longint);
var x,y,r:real;
    i,n_f:longint;
    S:real;
    x1,y1:integer;
begin
  randomize;
  n_f:=0;
  S:=7*15;
  for i:=1 to n do
  begin
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -1
   x-=1;//-1<=x<=6
   y:=random;
   y*=15;
   y-=3; //-3<=y<=12 
   x1:=150+round(30*x);
   y1:=120+round(30*y);
   if (y>=-3) and (y<=abs(x*x-4*X))
   then
   begin
     n_f:=n_f+1;
     Form1.Image1.canvas.pixels[x1,y1]:=clRed;
   end
   else
   Form1.Image1.canvas.pixels[x1,y1]:=clBlue;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,500,500);
Edit1.text:=inttostr(100000);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,500,500);
poi(strtoint(edit1.text));     //наставь точек
Edit2.text:=floattostr(Sf(strtoint(edit1.text)));//Вывод площади
end;

end.

