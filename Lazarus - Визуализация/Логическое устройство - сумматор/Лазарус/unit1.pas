unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Edit1.text='1') and (Edit2.text='1') then
  begin
    Edit3.text:='1';
    Edit4.text:='0';
    image1.Height:=400;
    image1.Width:=507;
    image1.Canvas.Rectangle(20,-100,image1.Width,image1.Height);
    image1.Picture.LoadFromFile('1_1.png');
  end
  else if (Edit1.text='0') and (Edit2.text='0') then
  begin
    Edit3.text:='0';
    Edit4.text:='0';
    image1.Height:=400;
    image1.Width:=507;
    image1.Canvas.Rectangle(20,-100,image1.Width,image1.Height); 
    image1.Picture.LoadFromFile('0_0.png');
  end
  else if (Edit1.text='0') and (Edit2.text='1') then
  begin
    Edit3.text:='0';
    Edit4.text:='1';
    image1.Height:=400;
    image1.Width:=507;
    image1.Canvas.Rectangle(20,-100,image1.Width,image1.Height);
    image1.Picture.LoadFromFile('0_1.png');
  end
  else if (Edit1.text='1') and (Edit2.text='0') then
  begin
    Edit3.text:='0';
    Edit4.text:='1';
    image1.Height:=400;
    image1.Width:=507;
    image1.Canvas.Rectangle(20,-100,image1.Width,image1.Height);
    image1.Picture.LoadFromFile('1_0.png');
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   image1.Height:=400;
   image1.Width:=507;
   image1.Canvas.Rectangle(20,-100,image1.Width,image1.Height);
  image1.Picture.LoadFromFile('111.png');
end;

end.

