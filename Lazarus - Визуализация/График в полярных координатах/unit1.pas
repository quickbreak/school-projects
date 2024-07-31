unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
         
function f(x:real):real;
begin
  f:=sin(6*x);
end;
procedure TForm1.FormCreate(Sender: TObject);
var x, y, dx, k, d_kl:real;
i, j: real;
ans,ras,x1,y1, x2, y2, p:real;
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,500,500);
dx:=0.0001;
d_kl:=1;
k:=40;
//отобразить начальные параметры
Edit1.text:='0';
Edit1.Readonly:=True;
Edit2.text:='2*pi';
Edit2.Readonly:=True;
Edit3.text:='0.0001';
Edit3.Readonly:=True;
Edit4.text:='24.90016729920050';
Edit4.Readonly:=True;
//сетка
image1.canvas.pen.width:=1;
image1.canvas.pen.color:=$888888;
i:=0;
while 250+round(i*k)<500 do
begin
image1.canvas.line(250+round(i*k), 500, 250+ round(i*k), 0);
image1.canvas.line(250-round(i*k), 500, 250-round(i*k), 0);
i+=2.15;
end;
j:=0;
while 250-round(j*k)>0 do
begin
image1.canvas.line(0, 250-round(j*k),500,250-round(j*k));
image1.canvas.line(0, 250+round(j*k),500,250+round(j*k));
j+=2.15;
end;
//оси
image1.canvas.pen.color:=clBlue;
image1.canvas.pen.width:=3;
//ox
image1.canvas.line(0, 250,500,250);
image1.canvas.line(500,250,490,240);
image1.canvas.line(500,250,490,260);
//oy
image1.canvas.line(250, 0, 250,500);
image1.canvas.line(250,0,240,10);
image1.canvas.line(250,0,260,10);
//ломаными
ans:=0;
x:=0;
p:=sin(6*x);
x1:=p*cos(x);
y1:=p*sin(x);    
image1.canvas.pen.width:=2;
image1.canvas.pen.color:=clRed;
image1.canvas.moveto(250+round(k*x1*2.15),250-round(k*y1*2.15));
while x<=2*pi do
begin
x:=x+0.00001;
p:=sin(6*x);
x2:=p*cos(x);
y2:=p*sin(x);
ras:=sqrt(sqr(x2-x1)+sqr(y2-y1));
ans:=ans+ras;
image1.canvas.lineto(250+round(k*x2*2.15),250-round(k*y2*2.15));
x1:=x2;
y1:=y2;
end
end;

end.

