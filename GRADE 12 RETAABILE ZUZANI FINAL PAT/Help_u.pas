unit Help_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  Vcl.ComCtrls, System.IOUtils;

type
  TfrmHelp = class(TForm)
    btnLoadHelp: TButton;
    wbrHelp: TWebBrowser;
    procedure btnLoadHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

procedure TfrmHelp.btnLoadHelpClick(Sender: TObject);
begin
 wbrHelp.Navigate('file:///' + TPath.Combine(GetCurrentDir, 'Help.htm')); // this loadts the webpage into the webbrowser component
end;

end.
