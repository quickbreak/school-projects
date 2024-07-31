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
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

var A:array[0..11] of integer;

{$R *.lfm}

{ TForm1 }

procedure vyvod(n,m:integer);  //вывод
var i:integer;
  x,y:integer;
  s:String;
begin
  form1.image1.Canvas.brush.color:=$FFFFFF;
  form1.image1.Canvas.brush.style:=bsSolid;
  form1.image1.Canvas.pen.color:=clBlack;
  form1.image1.Canvas.rectangle(0,0,800,200);  
  form1.image1.Canvas.pen.Width:=5;
  for i:=1 to m do
  begin
    form1.Image1.canvas.pen.color:=clRed;
    form1.Image1.canvas.ellipse((40+(i-1)*80)-35,65,40+(i-1)*80+35,135);
    s:=inttostr(A[i]);
    x:=(40+(i-1)*80)-form1.image1.canvas.TextWidth(s)div 2;
    y:=100-form1.image1.canvas.textheight(s)div 2;
    form1.image1.Canvas.textout(x,y,s);
  end;
  for i:=m+1 to n do
  begin
    form1.image1.Canvas.pen.color:=clGreen;
    form1.Image1.canvas.ellipse((40+(i-1)*80)-35,65,40+(i-1)*80+35,135);
    s:=inttostr(A[i]);
    x:=(40+(i-1)*80)-form1.image1.canvas.textwidth(s)div 2;
    y:=100-form1.image1.canvas.textheight(s)div 2;
    form1.image1.Canvas.textout(x,y,s);
  end;
  form1.repaint;
end;

procedure light(n,m,k:integer);  //highlight
var i:integer;
  x,y:integer;
  s:String;
begin
  form1.image1.Canvas.brush.color:=$FFFFFF;
  form1.image1.Canvas.brush.style:=bsSolid;
  // form1.image1.Canvas.pen.color:=clBlack;
  form1.image1.Canvas.rectangle(0,0,800,200);
  form1.image1.Canvas.pen.Width:=5;
  for i:=1 to 10 do
  begin
    if (i = n) or (i = m) then
       form1.Image1.canvas.pen.color:=clBlue
    else
      form1.Image1.canvas.pen.color:=clRed;
    form1.Image1.canvas.ellipse((40+(i-1)*80)-35,65,40+(i-1)*80+35,135);
    s:=inttostr(A[i]);
    x:=(40+(i-1)*80)-form1.image1.canvas.TextWidth(s)div 2;
    y:=100-form1.image1.canvas.textheight(s)div 2;
    form1.image1.Canvas.textout(x,y,s);
  end;
  for i:=10 downto 10-k+2 do
  begin
    form1.Image1.canvas.pen.color:=clGreen;
    form1.Image1.canvas.ellipse((40+(i-1)*80)-35,65,40+(i-1)*80+35,135);
    s:=inttostr(A[i]);
    x:=(40+(i-1)*80)-form1.image1.canvas.TextWidth(s)div 2;
    y:=100-form1.image1.canvas.textheight(s)div 2;
    form1.image1.Canvas.textout(x,y,s);
  end;
  form1.repaint;
end;

procedure done(); //highlight done
var i:integer;
  x,y:integer;
  s:String;
begin
  form1.image1.Canvas.brush.color:=$FFFFFF;
  form1.image1.Canvas.brush.style:=bsSolid;
  // form1.image1.Canvas.pen.color:=clBlack;
  form1.image1.Canvas.rectangle(0,0,800,200);
  form1.image1.Canvas.pen.Width:=5;
  for i:=1 to 10 do
  begin
    form1.Image1.canvas.pen.color:=clGreen;
    form1.Image1.canvas.ellipse((40+(i-1)*80)-35,65,40+(i-1)*80+35,135);
    s:=inttostr(A[i]);
    x:=(40+(i-1)*80)-form1.image1.canvas.TextWidth(s)div 2;
    y:=100-form1.image1.canvas.textheight(s)div 2;
    form1.image1.Canvas.textout(x,y,s);
  end;
  form1.repaint;
end;

procedure TForm1.Button1Click(Sender: TObject); //сгенерировать
var i:integer;
begin
  randomize;
  for i:=1 to 10 do A[i]:=random(90)+10;
  vyvod(10,10);
end;

procedure TForm1.Button2Click(Sender: TObject); //сортировать
var x:integer;
    i,j:integer;
begin
  for i:=1 to 10 do
  begin
    for j:=1 to 10-i do
    begin    
      sleep(1000);
      light(j,j+1,i);
      if a[j]>a[j+1] then
      begin   
         sleep(1000);
         light(j,j+1,i);
         x:=a[j+1];
         a[j+1]:=a[j];
         a[j]:=x;    
         sleep(100);
         light(j,j+1,i);
      end;
    end;
  end;
  //done();
end;

procedure TForm1.Button3Click(Sender: TObject); //прочитать массив из файла
var s:string;T1:Text;
    i:integer;
  n,m:integer;
begin
  if OpenDialog1.Execute
  then
  begin
     s:=OpenDialog1.FileName;
     while pos('\', s)<>0 do delete(s,1,pos('\',s));
     AssignFile(T1,s);
     reset(T1);
     i:=0;
     while not (eof(T1)) do
     begin
       i+=1;
       read(T1, m);
       a[i]:=m;
     end;
     closeFile(T1);
     vyvod(10,10);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject); //форма
var i:integer;
begin
  randomize;
  for i:=1 to 10 do A[i]:=random(90)+10;
  vyvod(10,10);
end;

end.

