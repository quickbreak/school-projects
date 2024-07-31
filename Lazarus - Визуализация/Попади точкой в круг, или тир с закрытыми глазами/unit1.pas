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
    Button6: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

var x,y:integer;
    rx,ry, R:integer;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
     image1.Canvas.rectangle(0,0,400,400);
     image1.Canvas.Ellipse(175,175,225,225);
     rx:=200; ry:=200; R:=25;
  end
  else
  begin
       image1.Canvas.rectangle(0,0,400,400);
       image1.Canvas.Ellipse(150,150,250,250);
       rx:=200; ry:=200; R:=50;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  randomize;
  x:=random(400);
  y:=random(400);
  image1.canvas.brush.color:=clblack;
  image1.canvas.brush.style:=bsSolid;
  image1.canvas.Ellipse(x-2,y-2,x+2,y+2);
end;

procedure TForm1.Button2Click(Sender: TObject); //show
begin
     if CheckBox2.Checked then
     begin
          image1.canvas.brush.color:=clblack;
          image1.canvas.brush.style:=bsSolid; 
          image1.canvas.MoveTo(x, y);
          if (abs(x-rx)<=R) and (abs(y-ry)<=R) then
             image1.canvas.LineTo(x, y)
          else if abs(x-rx)<=R then
             image1.canvas.LineTo(x, ry)
          else if abs(y-ry)<=R then
             image1.canvas.LineTo(rx, y)
          else
          begin
          image1.canvas.LineTo(rx, y);
          image1.canvas.LineTo(rx, ry);
          end;
     end
     else
     begin
     image1.canvas.brush.color:=clblack;
     image1.canvas.brush.style:=bsSolid;
     image1.canvas.Ellipse(x-2,y-2,x+2,y+2);
     end;
end;

procedure TForm1.Button3Click(Sender: TObject);//up
var step:integer;
dist1, dist2:integer;
begin
  dist1:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
  randomize;
  step:=random(2);
  step*=3;
  step+=2;
  image1.canvas.MoveTo(x, y-step);
  x:=x;y:=y-step;
  if CheckBox1.Checked then
  begin
      dist2:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
      if dist2<=R*R then
         Edit1.text:='Попал'
      else if dist2<dist1 then
         Edit1.text:='Теплее'
      else if dist2>dist1 then
         Edit1.text:='Холоднее'
      else Edit1.text:='think';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);//right
var step:integer; 
dist1, dist2:integer;
begin
  dist1:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
  randomize;
  step:=random(2);
  step*=3;
  step+=2;
  image1.canvas.MoveTo(x+step, y);
  x:=x+step;y:=y;
  if CheckBox1.Checked then
  begin
      dist2:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
      if dist2<=R*R then
         Edit1.text:='Попал'
      else if dist2<dist1 then
         Edit1.text:='Теплее'
      else if dist2>dist1 then
         Edit1.text:='Холоднее'
      else Edit1.text:='think';
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);//left
var step:integer;  
dist1, dist2:integer;
begin
  dist1:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
  randomize;
  step:=random(2);
  step*=3;
  step+=2;
  image1.canvas.MoveTo(x-step, y);
  x:=x-step;y:=y;
  if CheckBox1.Checked then
  begin
      dist2:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
      if dist2<=R*R then
         Edit1.text:='Попал'
      else if dist2<dist1 then
         Edit1.text:='Теплее'
      else if dist2>dist1 then
         Edit1.text:='Холоднее'
      else Edit1.text:='think';
  end;
end;

procedure TForm1.Button6Click(Sender: TObject); //down
var step:integer;  
dist1, dist2:integer;
begin
  dist1:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
  randomize;
  step:=random(2);
  step*=3;
  step+=2;
  image1.canvas.MoveTo(x, y+step);
  x:=x;y:=y+step;
  if CheckBox1.Checked then
  begin
      dist2:=(x-rx)*(x-rx)+(y-ry)*(y-ry);
      if dist2<=R*R then
         Edit1.text:='Попал'
      else if dist2<dist1 then
         Edit1.text:='Теплее'
      else if dist2>dist1 then
         Edit1.text:='Холоднее'
      else Edit1.text:='think';
  end;
end;

end.

