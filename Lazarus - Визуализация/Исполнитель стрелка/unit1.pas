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
    Button4: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    //procedure Edit1Change(Sender: TObject);
    //procedure Edit2Change(Sender: TObject);
    //procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation  

type t_strelka=object
       x,y:integer;
       col,sled:longint;
       ugol:integer;
       procedure init_napr(b:integer);
       procedure new_coord(new_x,new_y:integer);
       procedure new_color(new_col:integer);
       //function moget:boolean;
       procedure draw;
       procedure clear;
       procedure vpravo(a:integer);
       procedure shag(a:integer);
       procedure pryjok(a:integer);
     end;

  procedure t_strelka.draw;
var Ax,Ay,Bx,By,Cx,Cy:integer;
    alpha:real;
begin
  alpha:=ugol*pi/180;
  Ax:=x+round(20*sin(alpha));
  Ay:=y-round(20*cos(alpha));
  Cx:=x+round(5*sqrt(10)*sin(alpha+arctan(1/3)));
  Cy:=y-round(5*sqrt(10)*cos(alpha+arctan(1/3)));
  Bx:=x+round(5*sqrt(10)*sin(alpha-arctan(1/3)));
  By:=y-round(5*sqrt(10)*cos(alpha-arctan(1/3)));

  Form1.Image1.Canvas.Pen.color:=col;
  Form1.Image1.Canvas.Pen.width:=3;
  Form1.Image1.Canvas.line(x,y,Ax,Ay);
  Form1.Image1.Canvas.line(Ax,Ay,Bx,By);
  Form1.Image1.Canvas.line(Ax,Ay,Cx,Cy);
end;

procedure t_Strelka.vpravo(a:integer);          //поворот
begin
     clear;
     ugol:=ugol+a;
     draw;
end;

 procedure t_strelka.shag(a:integer);        //шаг
var alpha:real;
    x1, y1:integer;
begin
alpha:=ugol*pi/180;
     begin
        x1:=x+round(a*sin(alpha));
        y1:=y-round(a*cos(alpha));
        if (x1<549) and (y1<499) and (x1>0) and (y1>0) then
        begin 
        clear;
        Form1.Image1.Canvas.moveto(x,y);
        x:=x+round(a*sin(alpha));
        y:=y-round(a*cos(alpha));
        sled:=Form1.Image3.Canvas.Brush.Color;

        Form1.Image1.Canvas.Pen.Color:=sled;

        Form1.Image1.Canvas.lineto(x,y);
        draw;
        end;
     end;
end;

procedure t_strelka.pryjok(a:integer);
var alpha:real;
    x1, y1:integer;
begin
alpha:=ugol*pi/180;
     begin
        x1:=x+round(a*sin(alpha));
        y1:=y-round(a*cos(alpha));
        if (x1<549) and (y1<499) and (x1>0) and (y1>0) then
        begin
        clear;
        Form1.Image1.Canvas.moveto(x,y);
        x:=x+round(a*sin(alpha));
        y:=y-round(a*cos(alpha));
        draw
        end;
     end;
end;
procedure t_strelka.new_coord(new_x,new_y:integer);
begin
     x:=new_x;
     y:=new_y;
end;
procedure t_strelka.new_color(new_col:integer);
begin
     col:=new_col;
end;
procedure t_strelka.init_napr(b:integer);
begin
     ugol:=b;
end;
procedure t_strelka.clear;
var Ax,Ay,Bx,By,Cx,Cy:integer;
    alpha:real;
begin
alpha:=ugol*pi/180;
Ax:=x+round(20*sin(alpha));
Ay:=y-round(20*cos(alpha));
Cx:=x+round(5*sqrt(10)*sin(alpha+arctan(1/3)));
Cy:=y-round(5*sqrt(10)*cos(alpha+arctan(1/3)));
Bx:=x+round(5*sqrt(10)*sin(alpha-arctan(1/3)));
By:=y-round(5*sqrt(10)*cos(alpha-arctan(1/3)));

Form1.Image1.Canvas.Pen.Color:=clWhite;
Form1.Image1.Canvas.Pen.width:=5;
Form1.Image1.Canvas.line(x,y,Ax,Ay);
Form1.Image1.Canvas.line(Ax,Ay,Bx,By);
Form1.Image1.Canvas.line(Ax,Ay,Cx,Cy);

end;

{$R *.lfm}

{ TForm1 }


var arr:t_strelka;
procedure TForm1.FormCreate(Sender: TObject);  //При создании отобразить имажи
begin
   image1.Height:=500;
   image1.Width:=550;
   image1.Canvas.Pen.Color:=clWhite;
   image1.Canvas.Brush.Color:=clWhite;
   image1.Canvas.Brush.Style:=bsSolid;
   image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

   image2.Height:=50;
   image2.Width:=50;
   ///image2.Canvas.Pen.Color:=clBlack;
   image2.Canvas.Brush.Color:=clBlack;
   image2.Canvas.Brush.Style:=bsSolid;
   image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);

   image3.Height:=50;
   image3.Width:=50;
   ///image3.Canvas.Pen.Color:=clWhite;
   image3.Canvas.Brush.Color:=clWhite;
   image3.Canvas.Brush.Style:=bsSolid;
   image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);

   arr.new_coord(320,240);
   arr.init_napr(0);
   arr.new_color(clBlack);
   arr.draw;

   Form1.Edit1.text:='320';
   Form1.Edit2.text:='240';
   Form1.Edit3.text:='0';
   Form1.Edit4.text:='0';
   Form1.Edit5.text:='0';
   Form1.Edit6.text:='0';

end;

procedure TForm1.Button5Click(Sender: TObject);  //Поворот
var a, k:integer;
begin
   val(Edit6.Text,a,k);
   if k=0 then arr.vpravo(a);
end;

procedure TForm1.Button4Click(Sender: TObject);  //Прыжок
var a, k:integer;
begin
   val(Edit5.Text,a,k);
   if k = 0 then arr.pryjok(a);
end;

procedure TForm1.Button3Click(Sender: TObject);  //Шаг
var a, k:integer;
begin
   val(Edit4.Text,a,k);
   if k = 0 then arr.shag(a);
end;

procedure TForm1.Button2Click(Sender: TObject);  //Выполнить дейтсвия из файла
var s:string;T1:Text; komanda:string[4];
  n:integer;
begin
  if OpenDialog1.Execute
  then
  begin
     s:=OpenDialog1.FileName;
     while pos('\', s)<>0 do delete(s,1,pos('\',s));
     AssignFile(T1,s);
     reset(T1);
     while not (eof(T1)) do
     begin
       read(T1, komanda);readln(T1,n);
       if komanda='step' then arr.shag(n);
       if komanda='jump' then arr.pryjok(n);
       if komanda='turn' then arr.vpravo(n);
     end;
     closeFile(T1);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);   //установить
begin
   if not(CheckBox1.Checked) then
   begin
        arr.clear;
        arr.new_color(image2.Canvas.Brush.Color);
        arr.init_napr(StrToInt(edit3.Text));
        arr.new_coord(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
        arr.draw;
   end;
end;

procedure TForm1.Image2Click(Sender: TObject);   //Изменить цвет стрелки
var ris:TColor;
begin
   if ColorDialog1.Execute
   then
   begin
      ris:=ColorDialog1.Color;
      image2.Canvas.Pen.Color:=ris;
      image2.Canvas.Brush.Color:=ris;
      image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);
      arr.col:=ris;
   end;
end;

procedure TForm1.Image3Click(Sender: TObject);   //Изменить цвет следа
var fon:TColor;
begin
   if ColorDialog1.Execute
   then
   begin
      fon:=ColorDialog1.Color;
      //image1.Canvas.Pen.Color:=fon;
      image3.Canvas.Pen.Color:=fon;
      image3.Canvas.Brush.Color:=fon;
      image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);
     //image1.Canvas.Brush.Color:=fon;
      //image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
      arr.sled:=ColorDialog1.Color;
   end;
end;

end.

