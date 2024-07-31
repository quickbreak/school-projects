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
  S:=7*5;
  for i:=1 to n do
  begin
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -3
   x-=3;//-3<=x<=4
   y:=random;
   y*=5;
   y-=3; //-3<=y<=2
   if (((x>-1) and (y>=x-2)) or ((x<=-1) and (y>=-x-4))) and (y<=3/7*x+2/7)
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
  S:=7*5;
  for i:=1 to n do
  begin
   x:=random;//0<=x<=1  *7
   x*=7;//0<=x<=7 -3
   x-=3;//-3<=x<=4
   y:=random;
   y*=5;
   y-=3; //-3<=y<=2

   x1:=220+round(50*x);
   y1:=250+round(50*y);
   if (((x>-1) and (y>=x-2)) or ((x<=-1) and (y>=-x-4))) and (y<=3/7*x+2/7)
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

