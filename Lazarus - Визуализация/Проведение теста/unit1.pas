unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
type T_Zadanie=Record
     Usl:String;
     Otv:Array[1..4] of String;
     prav: integer;
end;
var Test:Array[1..100] of T_Zadanie;
n, nomer, VV:integer;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);  //enter
var T:TextFile;
i:integer;
begin
     AssignFile(T, 'ntcn.txt');
     Reset(T);
     n:=0;
     while not eof(T) do
     begin
          inc(n);
          readln(T,Test[n].Usl);
          for i:=1 to 4 do
          begin
               readln(T,Test[n].Otv[i]);
          end;
          readln (T, Test[n].prav);
     end;
     closeFile(T);
     nomer := 1;
     VV:=0;

     Edit1.Readonly:=True;
     Button1.Visible:=False;
     Label1.Visible:=False;
     Button5.Visible:=true;
     Button2.Visible:=true;
     Button3.Visible:=true;
     Button4.Visible:=true;
     Memo1.Visible:=true;
     Memo1.Clear;
     Memo1.Lines[0]:=Test[nomer].Usl;
     for i:=1 to 4 do
         Memo1.append(Test[nomer].Otv[i]);
     Edit1.visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);//A
var i:integer;
begin
if Test[nomer].prav=1 then inc(VV);
inc(nomer);
if nomer>n
then
begin
     Button2.visible:=false;
     Button3.visible:=false;
     Button4.visible:=false;
     Button5.visible:=false;
     Memo1.Clear;
     if VV <> n then
        Memo1.Lines[0]:='У пользователя ' + Edit1.Text+' правильных ответов: '+IntToStr(VV)
     else
          Memo1.Lines[0]:=Edit1.Text+' правильно ответил на все вопросы!';
     Memo1.Readonly:=true;
end
else
begin
    Memo1.Clear;
    Memo1.Lines[0]:=Test[nomer].Usl;
    for i:=1 to 4 do
        Memo1.append(Test[nomer].Otv[i]);
end
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
if Test[nomer].prav=2 then inc(VV);
inc(nomer);
if nomer>n
then
begin
     Button2.visible:=false;
     Button3.visible:=false;
     Button4.visible:=false;
     Button5.visible:=false;
     Memo1.Clear;
     if VV <> n then
         Memo1.Lines[0]:='У пользователя ' + Edit1.Text+' правильных ответов: '+IntToStr(VV)
     else
          Memo1.Lines[0]:=Edit1.Text+' правильно ответил на все вопросы!';
     Memo1.Readonly:=true;
end
else
begin

    Memo1.Clear;
    Memo1.Lines[0]:=Test[nomer].Usl;
    for i:=1 to 4 do
        Memo1.append(Test[nomer].Otv[i]);
end
end;

procedure TForm1.Button4Click(Sender: TObject);
var i:integer;
begin
if Test[nomer].prav=3 then inc(VV);
inc(nomer);
if nomer>n
then
begin
     Button2.visible:=false;
     Button3.visible:=false;
     Button4.visible:=false;
     Button5.visible:=false;
     Memo1.Clear;
     if VV <> n then
        Memo1.Lines[0]:='У пользователя ' + Edit1.Text+' правильных ответов: '+IntToStr(VV)
     else
          Memo1.Lines[0]:=Edit1.Text+' правильно ответил на все вопросы!';
     Memo1.Readonly:=true;
end
else
begin
    Memo1.Clear;
    Memo1.Lines[0]:=Test[nomer].Usl;
    for i:=1 to 4 do
        Memo1.append(Test[nomer].Otv[i]);
end
end;

procedure TForm1.Button5Click(Sender: TObject);
var i:integer;
begin
if Test[nomer].prav=4 then inc(VV);
inc(nomer);
if nomer>n
then
begin
     Button2.visible:=false;
     Button3.visible:=false;
     Button4.visible:=false;
     Button5.visible:=false;
     Memo1.Clear;
     if VV <> n then
        Memo1.Lines[0]:='У пользователя ' + Edit1.Text+' правильных ответов: '+IntToStr(VV)
     else
          Memo1.Lines[0]:=Edit1.Text+' правильно ответил на все вопросы!';
     Memo1.Readonly:=true;
end
else
begin
    Memo1.Clear;
    Memo1.Lines[0]:=Test[nomer].Usl;
    for i:=1 to 4 do
        Memo1.append(Test[nomer].Otv[i]);
end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.


