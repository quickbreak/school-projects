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
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

type T_Robot = Object
  n,m:integer;
  f:boolean;{робот функционирует}
  procedure hide;
  procedure show;
  procedure left;
  procedure right;
  procedure up;
  procedure down;
  function pr_left:boolean;{слева от робота есть стена}
  function pr_right:boolean;
  function pr_up:boolean;
  function pr_down:boolean;
end;

procedure T_Robot.hide; // спрятать картинку робота
begin
  Form1.image1.Canvas.Brush.color:=$00C5B050;
  Form1.image1.Canvas.Pen.Color:=clBlack;
  Form1.image1.Canvas.Pen.Width:=1;
  Form1.Image1.Canvas.Rectangle(22+(m-1)*40,
      22+(n-1)*40,18+m*40,18+n*40);
end;

procedure T_Robot.show; // показать картинку робота
var ris:TBitMap;
begin
  ris:=TBitMap.Create;
  ris.LoadFromFile('robot.bmp');
  Form1.image1.Canvas.Brush.color:=$00C5B050;
  Form1.Image1.Canvas.Draw(22+(m-1)*40,
      22+(n-1)*40,ris);
end;

procedure T_Robot.left;
begin
  if f
    then
    if pr_left
      then
      begin
        f:=false;
        hide;
        showmessage('Робот разбит')
      end
      else
    begin
      hide;
      dec(m);
      if m<1 then m:=10;
      show
    end;
end;
procedure T_Robot.right;
begin
  if f
    then
    if pr_right
      then
      begin
        f:=false;
        hide;
        showmessage('Робот разбит')
      end
      else
    begin
      hide;
      inc(m);
      if m>10 then m:=1;
      show
    end;
end;
procedure T_Robot.up;
begin
  if f
    then
    if pr_up
      then
      begin
        f:=false;
        hide;
        showmessage('Робот разбит')
      end
      else
    begin
      hide;
      dec(n);
      if n<1 then n:=10;
      show
    end;
end;
procedure T_Robot.down;
begin
  if f
    then
    if pr_down
      then
      begin
        f:=false;
        hide;
        showmessage('Робот разбит')
      end
      else
    begin
      hide;
      inc(n);
      if n>10 then n:=1;
      show
    end;
end;

var St:Array[1..10,1..10]of String;
  R:T_Robot;

function T_Robot.pr_left:boolean; // можно ли из этой клетки идти влево
begin
  if pos('l', St[n,m])>0
     then
         pr_left:=True
  else pr_left:=False;
end;
function T_Robot.pr_right:boolean; // можно ли из этой клетки идти вправо
begin
  if pos('r', St[n,m])>0
     then
         pr_right:=True
  else pr_right:=False;
end;
function T_Robot.pr_up:boolean; // можно ли из этой клетки идти вверх
begin
  if pos('u', St[n,m])>0
     then
         pr_up:=True
  else pr_up:=False;
end;
function T_Robot.pr_down:boolean; // можно ли из этой клетки идти вниз
begin
  if pos('d', St[n,m])>0
     then
         pr_down:=True
  else pr_down:=False;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject); // отрисовка локации при запуске
var i,j:integer;
begin
  image1.Canvas.Brush.color:=$00C5B050;
  image1.Canvas.Pen.Color:=clBlack;
  image1.Canvas.Pen.Width:=1;
  image1.Canvas.Rectangle(0,0,440,440);

  //клетки
  for i:=1 to 10 do
    for j:=1 to 10 do
      image1.Canvas.Rectangle(22+(j-1)*40,
      22+(i-1)*40,18+j*40,18+i*40);

  //стен пока нет
  for i:=1 to 10 do
    for j:=1 to 10 do St[i,j]:='';

  R.n:=1;
  R.m:=1;
  R.f:=true;
  R.show;
end;

procedure TForm1.Button2Click(Sender: TObject); //загрузить стены из файла
// (не показывая их пользователю)
  //St[1,1]:='rd';
  //St[1,2]:='l';
  //St[2,1]:='u';
var FileName,wall:String;
    t:TextFile;
    i,j:integer;
    a,b:char;
begin
  i:=0; j:=0;
  if OpenDialog2.Execute
    then
    begin
      FileName:=OpenDialog2.FileName;
      assignFile(T,FileName);
      reset(T);
      while not eof(T) do
      begin
        read(T, a); i:=strtoint(a); i+=1;
        read(T, b); j:=strtoint(b); j+=1;
        readln(T,wall);
        begin
           St[i,j]+=wall;
        end;
      end;
      closeFile(T);
    end;
end;

procedure TForm1.Button3Click(Sender: TObject); // отобразить стены
var i,j:integer;
begin
  image1.Canvas.Pen.Color:=clRed;
  image1.Canvas.Pen.Width:=3;
  for i:=1 to 10 do
    for j:=1 to 10 do
    begin
      if pos('u', St[i,j])>0 then
        image1.Canvas.Line(20+(j-1)*40,20+(i-1)*40,
        20+j*40,20+(i-1)*40);
      if pos('r', St[i,j])>0 then
        image1.Canvas.Line(20+j*40,20+(i-1)*40,
        20+j*40,20+i*40);
      if pos('d', St[i,j])>0 then
        image1.Canvas.Line(20+(j-1)*40,20+i*40,
        20+j*40,20+i*40);
      if pos('l', St[i,j])>0 then
        image1.Canvas.Line(20+(j-1)*40,20+(i-1)*40,
        20+(j-1)*40,20+i*40);
    end;
end; 

procedure TForm1.Button1Click(Sender: TObject); // оживить робота
begin
  R.f:=true;
  R.show;
end;

procedure TForm1.Button4Click(Sender: TObject); // вверх
begin
  if R.f
    then
    if checkbox1.Checked
    then
    begin
      if R.pr_up
        then showmessage('Стой, там стена')
        else showmessage('Можно идти')
    end
    else R.up;
end;

procedure TForm1.Button5Click(Sender: TObject); // влево
begin
  if R.f
    then
    if checkbox1.Checked
    then
    begin
      if R.pr_left
        then showmessage('Стой, там стена')
        else showmessage('Можно идти')
    end
    else R.left;
end;

procedure TForm1.Button6Click(Sender: TObject); // вправо
begin
  if R.f
    then
    if checkbox1.Checked
    then
    begin
      if R.pr_right
        then showmessage('Стой, там стена')
        else showmessage('Можно идти')
    end
    else R.right;
end;

procedure TForm1.Button7Click(Sender: TObject); // вниз
begin
  if R.f
    then
    if checkbox1.Checked
    then
    begin
      if R.pr_down
        then showmessage('Стой, там стена')
        else showmessage('Можно идти')
    end
    else R.down;
end;

procedure TForm1.Button8Click(Sender: TObject); // выполнить последовательность
// команд из файла
var FileName,command:String;
    t:TextFile;
begin
  if OpenDialog1.Execute
    then
    begin
      FileName:=OpenDialog1.FileName;
      assignFile(T,FileName);
      reset(T);
      sleep(500);
      while not eof(T) do
      begin
        readln(T,command);
        if R.f
          then
          begin
            if command='l' then R.left
            else if command='r' then R.right
            else if command='u' then R.up
            else if command='d' then R.down;
          end;
        form1.Repaint;
        sleep(500)
      end;
      closeFile(T);
    end;
end;

end.

