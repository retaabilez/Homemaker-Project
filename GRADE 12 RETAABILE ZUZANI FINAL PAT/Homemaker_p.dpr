program Homemaker_p;

uses
  Vcl.Forms,
  Opening_u in 'Opening_u.pas' {frmOpening},
  Login_u in 'Login_u.pas' {frmLogin},
  SignUp_u in 'SignUp_u.pas' {frmSignUp},
  Home_u in 'Home_u.pas' {frmHome},
  Help_u in 'Help_u.pas' {frmHelp},
  Upload_u in 'Upload_u.pas' {frmUpload},
  dmHomemaker_u in 'dmHomemaker_u.pas' {dmHomemaker: TDataModule},
  Profile_u in 'Profile_u.pas' {frmProfile},
  MyProperty_u in 'MyProperty_u.pas' {frmMyProperty},
  dmProperty_u in 'dmProperty_u.pas' {dmProperty: TDataModule},
  clsAgents_u in 'clsAgents_u.pas',
  clsCommissions_u in 'clsCommissions_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmOpening, frmOpening);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(TfrmUpload, frmUpload);
  Application.CreateForm(TdmHomemaker, dmHomemaker);
  Application.CreateForm(TfrmProfile, frmProfile);
  Application.CreateForm(TfrmMyProperty, frmMyProperty);
  Application.CreateForm(TdmProperty, dmProperty);
  Application.Run;
end.
