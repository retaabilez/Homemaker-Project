unit Opening_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Login_u, SignUp_u;

type
  TfrmOpening = class(TForm)
    pnlSignUp: TPanel;
    pnlLogin: TPanel;
    imgFront: TImage;
    lblTitle: TLabel;
    lblCaption: TLabel;
    tmrTitle: TTimer;
    lblHelp: TLabel;
    procedure btnLogInClick(Sender: TObject);
    procedure pnlSignUpClick(Sender: TObject);
    procedure pnlLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrTitleTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpening: TfrmOpening;
   iVerticalDirection, iHorizontalDirection : Integer;
  iCount : Integer;

implementation

{$R *.dfm}



procedure TfrmOpening.btnLogInClick(Sender: TObject);
begin
 frmOpening.Hide;
 frmLogin.Show;
end;

procedure TfrmOpening.FormCreate(Sender: TObject);
begin
 iVerticalDirection := 1;

 iCount := 0;
end;

procedure TfrmOpening.pnlLoginClick(Sender: TObject);
begin
 frmOpening.Hide;
 frmLogin.Show;
end;

procedure TfrmOpening.pnlSignUpClick(Sender: TObject);
begin
  frmOpening.Hide;
 frmSignup.Show;
end;

procedure TfrmOpening.tmrTitleTimer(Sender: TObject);
begin

 if iVerticalDirection = 1 then
  begin
    lblTitle.Top := lblTitle.Top + 10;
    if lblTitle.Top > 160 then
    begin
      iVerticalDirection := 0;
    end;
  end
  else
  begin
    lblTitle.Top := lblTitle.Top - 10;
    if lblTitle.Top < 77 then
    begin
      iVerticalDirection := 1;
    end;
  end;

end;

end.
