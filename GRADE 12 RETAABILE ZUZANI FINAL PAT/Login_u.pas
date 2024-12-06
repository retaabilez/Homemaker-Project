unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Home_u;

type
  TfrmLogin = class(TForm)
    edtEmail: TEdit;
    lblEmail: TLabel;
    edtPassword: TEdit;
    lblPassword: TLabel;
    rgpType: TRadioGroup;
    btnBack: TButton;
    lblSignUp: TLabel;
    Panel1: TPanel;
    imgicon: TImage;
    imgBackground: TImage;
    procedure lblSignUpClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  sEmail, sPassword : STring;
  bOwner, bFound, bAgent : Boolean;
  iUserID : Integer;

implementation

{$R *.dfm}

uses SignUp_u, dmHomemaker_u;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
 imgBackground.SendToBack;
 lblEmail.BringToFront;
 lblPassword.BringToFront;
end;

procedure TfrmLogin.lblSignUpClick(Sender: TObject);
begin
  frmLogin.Hide;
  frmSignUp.Show;
end;

procedure TfrmLogin.Panel1Click(Sender: TObject);
begin
// input : getting values for user email and password
   sEmail := edtEmail.Text;
   sPassword := edtPassword.Text;
   bFound := False;
   bAgent := False;
   bOwner := False;

   case rgpType.ItemIndex of
   -1 : Showmessage('Please select account type');
    0: bOwner := True;
    1: bAgent := True;
   end;

   // processing: Comparing the values to existing fields in the database

  with dmHomemaker do
  begin
    tblOwners.First;
    tblAgents.First;

    // if a client has classifed themselves as an owner
    if bOwner = True then
    begin
      while NOT tblOwners.Eof do
       begin
         if (sEmail = tblOwners['Email']) AND (sPassword = tblOwners['Password']) then
         begin
          bFound := True; // if the user has been found with all the correct details
          Showmessage('Log in complete! Happy Housing!');
          iUserID := tblOwners['OwnerID'];  // this is to be made use of on frmProfile (where the user can edit their information)
         end;
         tblOwners.Next; // moves onto the next record of the database if not found
       end;
    end;

   // if the user has classified themselves as an agent
    if bAgent = true then
    begin
     while NOT tblAgents.Eof do
      begin
       if (sEmail = tblAgents['Email']) AND (sPassword = tblAgents['Password']) then
         begin
          bFound := True; // if the user has been found with all the correct details
          Showmessage('Log in complete! Happy Housing!');
          iUserID := tblAgents['AgentID'];  // this is to be made use of on frmProfile (where the user can edit their information)
         end;
         tblAgents.Next; // moves onto the next record of the database if not found
      end;
    end;
  end;

   // output: depending on whether an existing profile has been found or not
   if bFound = False then  // if the email does not align with the password
   begin
     Showmessage('Incorrect email or password.');
   end
   else
   begin
    frmLogin.Hide;
    frmHome.SHow;
   end;

end;

end.
