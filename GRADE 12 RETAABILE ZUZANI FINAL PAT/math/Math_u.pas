unit Math_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var iTotal, iTotal2, iTotal3, iTotal4, iTotal5  : Integer;
rTotal, rTotal2, rTotal3, rTotal4, rTotal5  : Real;

begin

//Input

 // 4.2.1
 iTotal := (12 + 4 * 4) DIV 2;

 //4.2.2
 iTotal2 := 12 + 4 * 4 DIV 2;

 //4.2.3
 rTotal := 10 - 4 / 2 * 6 + 3;

 //4.2.4
rTotal2 :=  8  * 4 - 17 / 2 + 3;

//4.2.5

rTotal3 := 4 * ( 6 /2 +3  );

//4.2.6

rTotal4 := 4 * 6/ 2 /4 + 3;

// 4.2.7
rTotal5 := 17 DIV 2 * (4 * 5 +(10 - 1)) * 2.3;

// 4.2.8
iTotal3 := 23 MOD 3 * (13 DIV 2 � 5);

//4.2.9
iTotal4 := 69 MOD (3 + 5) + 1.1 * 4.7;

// 4.2.10
iTotal5 := (32 MOD 7) * (26 DIV 8);
//Processsing

//Output
     redOutput.Lines.Add ('(12 + 4 * 4) DIV 2 = '  +  IntToStr(iTotal));
     redOutput.Lines.Add('12 + 4 * 4 DIV 2 = ' + IntToStr(iTotal2));
     redOutput.Lines.Add('10 -4 / 2 * 6 + 3 = ' + FloatToStr(rTotal));
     redOutput.Lines.Add('8 * 4 - 17 / 2 + 3 = '  +  FloatToStr(rTotal2));
     redOutput.Lines.Add('4 * (6 /2 +3 =' + FloatToStr(rTotal3));
     redOutput.Lines.Add(' 4 * 6 / 2 / 4 + 3 = ' + FloatToStr(rTotal4));
     redOutput.Lines.Add(' 17 DIV 2 * (4 * 5 +(10 � 1)) * 2.3 = ' + FloatToStr(rTotal5));
     redOutput.Lines.Add(' 23 MOD 3 * (13 DIV 2 �5) = ' + IntToStr(iTotal3));
     redOutput.Lines.Add(' 69 MOD (3 + 5) + 1.1 * 4.7 = ' + IntToStr(iTotal4));
     redOutput.Lines.Add ('(32 MOD 7) * (26 DIV 8) = '  +  IntToStr(iTotal5));
end;

end.
