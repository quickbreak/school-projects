unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    ColorDialog1: TColorDialog;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

var x1,y1:integer;

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin
   image1.Height:=650;
   image1.Width:=650;
   image1.Canvas.Pen.Color:=clWhite;
   image1.Canvas.Brush.Color:=clWhite;
   image1.Canvas.Brush.Style:=bsSolid;
   image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

   image2.Height:=50;
   image2.Width:=50;
   image2.Canvas.Pen.Color:=clGreen;
   image2.Canvas.Brush.Color:=clGreen;
   image2.Canvas.Brush.Style:=bsSolid;
   image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);

   image3.Height:=50;
   image3.Width:=50;
   image3.Canvas.Pen.Color:=clWhite;
   image3.Canvas.Brush.Color:=clWhite;
   image3.Canvas.Brush.Style:=bsSolid;
   image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   if SaveDialog1.Execute
   then
     image1.Picture.SaveToFile(SaveDialog1.Filename);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
   if OpenDialog1.Execute
   then
   image1.Picture.LoadFromFile(OpenDialog1.Filename);
end;

procedure TForm1.Image2Click(Sender: TObject);
var ris:TColor;
begin
   if ColorDialog1.Execute
   then
   begin
      ris:=ColorDialog1.Color;
      image2.Canvas.Pen.Color:=ris;
      image2.Canvas.Brush.Color:=ris;
      image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   image1.Height:=650;
   image1.Width:=650;
   image1.Canvas.Pen.Width:=2*ListBox1.ItemIndex+2;
   image1.Canvas.Pen.Color:=image3.Canvas.Pen.Color;
   image1.Canvas.Brush.Color:=image3.Canvas.Pen.Color;
   image1.Canvas.Brush.Style:=bsSolid;
   image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
end;
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  image1.Canvas.MoveTo(x,y);
  x1:= x;
  y1:= y;

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if RadioButton4.Checked and (ssLeft in Shift) then
  begin
       image1.Canvas.Pen.Color:=image2.Canvas.Brush.Color;
       image1.Canvas.Pen.Width:=2*ListBox1.ItemIndex+2;  // 2*х+2
       image1.Canvas.LineTo(x,y);
  end;
  if RadioButton5.Checked and (ssLeft in Shift) then
  begin
      image1.Canvas.Pen.Color:=image3.Canvas.Brush.Color;
      image1.Canvas.Brush.Color:=image3.Canvas.Brush.Color;
      image1.Canvas.Brush.Style:=bsSolid;
      //image1.Canvas.Pen.Width:=2*ListBox1.ItemIndex+2;
      image1.Canvas.Rectangle(X-10,Y-20,X+10,Y+20);
  end;
  if RadioButton6.Checked and (ssLeft in Shift) then
  begin
      image1.Canvas.Pen.Color:=image3.Canvas.Brush.Color;
      image1.Canvas.Brush.Color:=image3.Canvas.Brush.Color;
      image1.Canvas.Brush.Style:=bsSolid;
      //image1.Canvas.Pen.Width:=2*ListBox1.ItemIndex+2;
      image1.Canvas.Rectangle(x1,y1,x,y);
  end;
end;
procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   image1.Canvas.Pen.Color:=image2.Canvas.Brush.Color;
   image1.Canvas.Brush.Color:=image2.Canvas.Brush.Color;
   if CheckBox1.Checked
   then image1.Canvas.Brush.Style:=bsClear
   else image1.Canvas.Brush.Style:=bsSolid;
   image1.Canvas.Pen.Width:=2*ListBox1.ItemIndex+2;
   if RadioButton1.Checked
   then image1.Canvas.LineTo(x,y);
   if RadioButton2.Checked
   then image1.Canvas.Rectangle(x1,y1,x,y);
   if RadioButton3.Checked
   then image1.Canvas.Ellipse(x1,y1,x,y);
   //if RadioButton3.Checked
   //then image1.Canvas.LineTo(x,y);
end;

procedure TForm1.Image3Click(Sender: TObject);
var fon:TColor;
begin
   if ColorDialog1.Execute
   then
   begin
      fon:=ColorDialog1.Color;
      image1.Canvas.Pen.Color:=fon;
      image3.Canvas.Pen.Color:=fon;
      image3.Canvas.Brush.Color:=fon;
      image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);
      image1.Canvas.Brush.Color:=fon;
      image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
   end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
   image1.Height:=650;
   image1.Width:=650;
   image1.Canvas.Pen.Width:=1;
   image1.Canvas.Pen.Color:=clWhite;
   image1.Canvas.Brush.Color:=clWhite;
   image1.Canvas.Brush.Style:=bsSolid;
   image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);

   image2.Height:=50;
   image2.Width:=50;
   image2.Canvas.Pen.Width:=1;
   image2.Canvas.Pen.Color:=clGreen;
   image2.Canvas.Brush.Color:=clGreen;
   image2.Canvas.Brush.Style:=bsSolid;
   image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);

   image3.Height:=50;
   image3.Width:=50;
   image3.Canvas.Pen.Width:=1;
   image3.Canvas.Pen.Color:=clWhite;
   image3.Canvas.Brush.Color:=clWhite;
   image3.Canvas.Brush.Style:=bsSolid;
   image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);
end;

end.

