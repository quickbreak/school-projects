unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var x, y, dx, k, d_kl:real;
i, j: integer;
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,640,618);
x:=-5;
y:=sin(x)-(1/x)+5;
dx:=0.0001;
d_kl:=1;
k:=31*d_kl;
//отобразить начальные параметры
Edit1.text:='-5';
Edit2.text:='5';
Edit3.text:='0.0001';
Checkbox1.Checked:=True;
RadioButton1.Checked:=True;

//сетка
image1.canvas.pen.width:=1;
image1.canvas.pen.color:=$888888;
i:=0;
while 320+round(i*d_kl*k)<640 do
begin
image1.canvas.line(320+round(i*d_kl*k), 618, 320+ round(i*d_kl*k), 0);
image1.canvas.line(320-round(i*d_kl*k), 618, 320-round(i*d_kl*k), 0);
inc(i);
end;
j:=0;
while 309-round(j*d_kl*k)>0 do
begin
image1.canvas.line(0, 309-round(j*d_kl*k),640,309-round(j*d_kl*k));
image1.canvas.line(0, 309+round(j*d_kl*k),640,309+round(j*d_kl*k));
inc(j);
end;
//оси
image1.canvas.pen.color:=clBlue;
image1.canvas.pen.width:=3;
//ox
image1.canvas.line(0, 400,640,400);
image1.canvas.line(640,400,630,390);
image1.canvas.line(640,400,630,410);
//oy
image1.canvas.line(320, 0, 320,618);
image1.canvas.line(320,0,310,10);
image1.canvas.line(320,0,330,10);
//по точкам
while x<=5 do
begin
i:=320+round(x*k);
j:=400-round(y*k);
image1.canvas.pixels[i,j]:=clRed;
x+=dx;
y:=sin(x)-(1/x)+5;
end
end;

procedure TForm1.Button2Click(Sender: TObject);   //построить
var x, y, dx, k, d_kl:real;
i, j: integer;
a,b:double;
s:string;
ymin, ymax:real;
flag :boolean;
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,640,618);
x:=strtoint(Edit1.text);
y:=sin(x)-(1/x)+5;
s:=Edit3.text;
if s[2]='.' then s[2]:=',';
edit3.text:=s;
dx:=strtofloat(s);
d_kl:=strtofloat(listbox1.GetSelectedText);
k:=31;

//сетка
if Checkbox1.Checked
then begin
  image1.canvas.pen.width:=1;
  image1.canvas.pen.color:=$888888;
  i:=0;
  while 320+round(i*d_kl*k)<640 do
  begin
  image1.canvas.line(320+round(i*d_kl*k), 618, 320+ round(i*d_kl*k), 0);
  image1.canvas.line(320-round(i*d_kl*k), 618, 320-round(i*d_kl*k), 0);
  inc(i);
  end;
  j:=0;
  while 309-round(j*d_kl*k)>0 do
  begin
  image1.canvas.line(0, 309-round(j*d_kl*k),640,309-round(j*d_kl*k));
  image1.canvas.line(0, 309+round(j*d_kl*k),640,309+round(j*d_kl*k));
  inc(j);
  end;
end;
//оси
image1.canvas.pen.color:=clBlue;
image1.canvas.pen.width:=3;
//ox
image1.canvas.line(0, 400,640,400);
image1.canvas.line(640,400,630,390);
image1.canvas.line(640,400,630,410);
//oy
image1.canvas.line(320, 0, 320,618);
image1.canvas.line(320,0,310,10);
image1.canvas.line(320,0,330,10);

if checkbox2.checked then           //построение
begin
  flag:=True;
  ymin:=strtofloat(edit4.text);
  //ymin:=400-round(ymin*k*d_kl);
  ymax:=strtofloat(edit5.text);
  //ymax:=400-round(ymax*k*d_kl);
end;

//по точкам
if RadioButton1.Checked  then
begin
while x<=strtoint(Edit2.text) do
begin
i:=320+round(x*k*d_kl);
j:=400-round(y*k*d_kl);
if flag then
begin
if (x<>0) and (y>=ymin) and (y<=ymax)  then
image1.canvas.pixels[i,j]:=clRed;
end
else if i<>0 then  image1.canvas.pixels[i,j]:=clRed;
x+=dx;
y:=sin(x)-(1/x)+5;
end
end
else //ломаными
begin
a:=strtofloat(Edit1.text);
b:= strtofloat(Edit2.text);
image1.canvas.pen.width:=2;
image1.canvas.pen.color:=clRed;
image1.canvas.moveto(320+round(k*x*d_kl),400-round(k*y*d_kl));
while x<1 do  begin
x:=x+dx;
y:=sin(x)-(1/x)+5;
if flag then
begin
if (x<>0) and (y>=ymin) and (y<=ymax) then
image1.canvas.lineto(320+round(k*x*d_kl),400-round(k*y*d_kl))
else image1.canvas.moveto(320+round(k*x*d_kl),400-round(k*y*d_kl));
end
else if 320+round(k*x*d_kl)<>0 then
image1.canvas.lineto(320+round(k*x*d_kl),400-round(k*y*d_kl))
else image1.canvas.moveto(320+round(k*x*d_kl),400-round(k*y*d_kl))
end;
while (x<b) and(x>1) do  begin
x:=x+dx;
y:=sin(x)-(1/x)+5;
if flag then
begin
if (x<>0) and (y>=ymin) and (y<=ymax) then
image1.canvas.lineto(320+round(k*x*d_kl),400-round(k*y*d_kl))
else image1.canvas.moveto(320+round(k*x*d_kl),400-round(k*y*d_kl))
end
else
begin
if 320+round(k*x*d_kl)<>0 then
image1.canvas.lineto(320+round(k*x*d_kl),400-round(k*y*d_kl))
else image1.canvas.moveto(320+round(k*x*d_kl),400-round(k*y*d_kl))
end
end
end
end;

procedure TForm1.Button1Click(Sender: TObject);//наименьшее наибольшее значения
var start, finish:real;
    i:integer;
    minval, eps, maxval:real;
    s:string;
begin
     s:=Edit3.text;
     if s[2]='.' then s[2]:=',';
     edit3.text:=s;
     eps:=strtofloat(Edit3.text);
     minval:=2000000;
     maxval:=-10000000;
     start:=strtofloat(Edit1.text);
     finish:=strtofloat(Edit2.text);
     while start <= finish do
     begin
          start+=eps;
          if start<>0 then
             if (sin(start)-(1/start)+5)<minval
                then minval:=(sin(start)-(1/start)+5);
             if (sin(start)-(1/start)+5)>maxval
                then maxval:=(sin(start)-(1/start)+5);
     end;
     Edit4.Text:=floattostr(minval);
     Edit5.Text:=floattostr(maxval);
end;

procedure TForm1.Button3Click(Sender: TObject);
var x, y, dx, k, d_kl:real;
i, j: integer;
s:string;
begin
image1.canvas.pen.color:=clBlack;
image1.canvas.pen.width:=1;
image1.canvas.brush.color:=clWhite;
image1.canvas.brush.style:=bsSolid;
image1.canvas.rectangle (0,0,640,618);
x:=strtoint(Edit1.text);
y:=sin(x)-(1/x)+5;
s:=Edit3.text;
if s[2]='.' then s[2]:=',';
edit3.text:=s;
dx:=strtofloat(s);
d_kl:=strtofloat(listbox1.GetSelectedText);
k:=31;

//сетка
if Checkbox1.Checked
then begin
  image1.canvas.pen.width:=1;
  image1.canvas.pen.color:=$888888;
  i:=0;
  while 320+round(i*d_kl*k)<640 do
  begin
  image1.canvas.line(320+round(i*d_kl*k), 618, 320+ round(i*d_kl*k), 0);
  image1.canvas.line(320-round(i*d_kl*k), 618, 320-round(i*d_kl*k), 0);
  inc(i);
  end;
  j:=0;
  while 309-round(j*d_kl*k)>0 do
  begin
  image1.canvas.line(0, 309-round(j*d_kl*k),640,309-round(j*d_kl*k));
  image1.canvas.line(0, 309+round(j*d_kl*k),640,309+round(j*d_kl*k));
  inc(j);
  end;
end;
//оси
image1.canvas.pen.color:=clBlue;
image1.canvas.pen.width:=3;
//ox
image1.canvas.line(0, 400,640,400);
image1.canvas.line(640,400,630,390);
image1.canvas.line(640,400,630,410);
//oy
image1.canvas.line(320, 0, 320,618);
image1.canvas.line(320, 0, 310,10);
image1.canvas.line(320,0,330,10);
end;

end.

