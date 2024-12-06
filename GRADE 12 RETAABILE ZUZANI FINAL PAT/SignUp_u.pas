unit SignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, dmHomemaker_u, clsAgents_u;

type
  TfrmSignUp = class(TForm)
    edtEmail: TEdit;
    edtPassword: TEdit;
    edtName: TEdit;
    edtSurname: TEdit;
    edtRate: TEdit;
    lblEmail: TLabel;
    lblPassword: TLabel;
    lblName: TLabel;
    lblSurname: TLabel;
    lblRate: TLabel;
    lblLoggedIn: TLabel;
    lblCell: TLabel;
    edtCell: TEdit;
    pnlSignup: TPanel;
    rgpType: TRadioGroup;
    lblQualification: TLabel;
    edtQualification: TEdit;
    imgBackground: TImage;
    imgicon: TImage;
    btnBack: TButton;
    procedure lblLoggedInClick(Sender: TObject);
    procedure pnlSignupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
    objAgent : TAgents;
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

{$R *.dfm}

uses Login_u, opening_u;



procedure TfrmSignUp.btnBackClick(Sender: TObject);
begin
 frmSignup.hide;
 frmOpening.show;
end;

procedure TfrmSignUp.FormCreate(Sender: TObject);
begin
  imgBackground.SendToBack;
  lblEmail.BringToFront;
  lblPassword.BringToFront;
  lblName.BringToFront;
  lblSurname.BringToFront;
  lblRate.BringToFront;
  lblLoggedIn.BringToFront;
  lblCell.BringToFront;

end;

procedure TfrmSignUp.lblLoggedInClick(Sender: TObject);
begin
 frmSignUp.Hide;
 frmLogin.SHow;
end;

procedure TfrmSignUp.pnlSignupClick(Sender: TObject);
var sEmail, sPassword, sName, sSurname, sCell, sQualification : string;
    rRate : real;
    iCell : Integer;
    bOwner, bAgent, bSelected, bMade, bQuali: boolean;
begin
 // input : assigning the values put in by the user
 // data validation: these variables need values regardless of the type of user

 if NOT (edtEmail.Text = '') OR NOT (edtPassword.Text = '') then
 begin
   if NOT(edtName.Text = '') OR NOT (edtSurname.Text = '') OR NOT (edtCell.text = '') then
   begin
     sEmail := edtEmail.Text;
     sPassword := edtPassword.Text;
     sName := edtName.Text;
     sSurname := edtSurname.Text;
     iCell :=StrToInt(edtCell.Text);
   end
   else
   begin
    Showmessage('Please fill in all information');
   end;
 end
 else
 begin
   Showmessage('Please fill in all information');
 end;

 rRate := StrToFloat(edtRate.Text);  // this is set outside of the validation loop because a user classified as an owner wouldnt use this
 sQualification := edtQualification.Text;

 // testing the sQualification value;
  objAgent := TAgents.create(sEmail,sPassword, sName, sSurname, sQualification, iCell, rRate);
  bQuali := objAgent.CheckQualification(sQualification); // this will check if the qualification is an acceptable one

  bSelected := true;

  // processing: how the user info is stored onto the database
 case rgpType.ItemIndex of
  -1: bSelected := false;  // if nothing has been selected, bSelected is false (users wont be allowed to sign up)
  0: bOwner := true;  // this classifies the user signing up as an owner
  1: bAgent := true;  // this classifies the user signing up as an agent
 end;

 if bSelected = false then
 begin
   Showmessage('Please select the user type you are');
 end
 else
 begin
   if bAgent = true AND bQuali = true then
    begin
      with dmHomemaker do  // making use of the database: adding a new user classified as an agent
     begin
       tblAgents.Append;
       tblAgents['FirstName'] := sName;
       tblAgents['Surname'] := sSurname;
       tblAgents['Email'] := sEmail;
       tblAgents['Password'] := sPassword;
       tblAgents['CellphoneNumber'] := iCell;
       tblAgents['Qualification'] := sQualification;
       tblAgents['Rate'] := rRate;
       tblAgents.Post;
       bMade := true;
     end;
    end
    else
    begin
      if bOwner = true then
     with dmHomemaker do  // making use of the database: adding a new user classified as an owner
     begin
       tblOwners.Append;
       tblOwners['FirstName'] := sName;
       tblOwners['Surname'] := sSurname;
       tblOwners['Email'] := sEmail;
       tblOwners['Password'] := sPassword;
       tblOwners['CellphoneNumber'] := iCell;
       tblOwners.Post;
       bMade := true;
     end;
    end;

    if bMade = true then
    begin
      if MessageDlg('Congratulations on signing up! Please log in with your new account', mtInformation, [mbOK], 0) = mrOK then
      begin
        frmSignup.Hide;
        frmLogin.Show;
      end;
    end
    else
    begin
      SHowmessage('Your account could not be made. Please ensure you have filled in everything necessary for your type of account');
    end;
 end;

  // output


end;

end.
