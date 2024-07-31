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
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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

procedure TForm1.FormCreate(Sender: TObject);
var i,j, k:real;
begin
  image1.canvas.rectangle (0,0,400,400);
//оси
image1.canvas.pen.color:=clBlue;
image1.canvas.pen.width:=3;
//ox
image1.canvas.line(0, 200,400,200);
image1.canvas.line(400,200,390,190);
image1.canvas.line(400,200,390,210);
//oy
image1.canvas.line(200, 0, 200,400);
image1.canvas.line(200,0,190,10);
image1.canvas.line(200,0,210,10);
end;

procedure TForm1.Button1Click(Sender: TObject); //показ
var ax,bx,cx,ay, by, cy, ox, oy, R:integer;
pa, pb:longint;
i,j, k:integer;
begin
     image1.canvas.rectangle (0,0,400,400);
    //оси
    image1.canvas.pen.color:=clBlue;
    image1.canvas.pen.width:=3;
    //ox
    image1.canvas.line(0, 200,400,200);
    image1.canvas.line(400,200,390,190);
    image1.canvas.line(400,200,390,210);
    //oy
    image1.canvas.line(200, 0, 200,400);
    image1.canvas.line(200,0,190,10);
    image1.canvas.line(200,0,210,10);
     //читаем
    Ax:=strtoint(Edit1.Text);
    Ay:=strtoint(Edit2.Text);
    Bx:=strtoint(Edit3.Text);
    By:=strtoint(Edit4.Text);
    Ox:=strtoint(Edit5.Text);
    Oy:=strtoint(Edit6.Text);
    R:=strtoint(Edit7.Text);
    //строим
    k:=2;
    image1.canvas.pen.color:=clRed;
    image1.canvas.brush.style:=bsclear;
    image1.canvas.Ellipse(200+k*(Ox-R),200-k*(Oy-R),200+k*(Ox+R),200-k*(Oy+R));

    image1.canvas.line(200+Ax*k,200-Ay*k,200+Bx*k,200-By*k);

    pa:= sqr(ax-ox)+sqr(ay-oy);
    pb:= sqr(bx-ox)+sqr(by-oy);
    if (pa<R*R) and (pb<R*R)
    then Edit8.Text:='Нет общих точек'
    else if (pa>=R*R) and (pb<=R*R) or (pa<=R*R) and (pb>=R*R)
    then Edit8.Text:='Есть общие точки'
    else Edit8.Text:='Не определено';

end;

end.

