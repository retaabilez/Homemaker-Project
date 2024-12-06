unit Profile_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Login_u;

type
  TfrmProfile = class(TForm)
    lblEmail: TLabel;
    lblPassword: TLabel;
    lblName: TLabel;
    lblSurname: TLabel;
    edtEmail: TEdit;
    edtPassword: TEdit;
    edtName: TEdit;
    edtSurname: TEdit;
    lblCell: TLabel;
    edtCell: TEdit;
    lblType: TLabel;
    pnlExit: TPanel;
    pnlUpdate: TPanel;
    lblRate: TLabel;
    edtRate: TEdit;
    btnUser: TButton;
    imgBackground: TImage;
    imgicon: TImage;
    pnlDelete: TPanel;
    procedure btnUserClick(Sender: TObject);
    procedure pnlUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProfile: TfrmProfile;
  edtQualification: TEdit;
  lblRate: TLabel;
  lblQualification: TLabel;

implementation

{$R *.dfm}

uses dmHomemaker_u;

procedure TfrmProfile.btnUserClick(Sender: TObject);
var
  edtRate: TEdit;
  rValue : Real;
begin
 lblType.Visible := true;

  if bOwner = true then
  begin
    lblType.Caption := 'Owner';
  end;

  if bAgent = true then
  begin
    lblType.Caption := 'Agent';
  end;
end;

procedure TfrmProfile.FormCreate(Sender: TObject);
begin
 imgBackground.SendToBack;
end;

procedure TfrmProfile.pnlDeleteClick(Sender: TObject);  // this allows the user to delete their profile/ account
begin
 if messagedlg('Are you sure you want to delete your account?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with dmHomemaker do
    begin
      if bOwner = true then
     begin
      tblOwners.First;
      while NOT tblOwners.EOF do
      begin
        if tblOwners['OwnerID'] = iUserID then
         begin
           tblOwners.Delete;
         end;
        tblOwners.Next;
      end;
     end;

       if bAgent = true then
     begin
      tblAgents.First;
      while NOT tblAgents.EOF do
      begin
        if tblOwners['AgentID'] = iUserID then
         begin
           tblAgents.Delete;
         end;
        tblAgents.Next;
      end;
     end;
    end;

    Showmessage('Account deleted. Thank you for making use of Homemaker.');
  end;
end;

procedure TfrmProfile.pnlUpdateClick(Sender: TObject);
begin
 with dmHomemaker do
 begin
   if bOwner = true then
   begin
     tblOwners.First;
     while NOT tblOwners.EOF do
      begin
        if tblOwners['OwnerID'] = iUserID then
         begin
           tblOwners.Edit;
           tblOwners['FirstName'] := edtName.Text;
           tblOwners['Surname'] := edtSurname.Text;
           tblOwners['CellphoneNumber']  := StrToInt(edtCell.Text);
           tblOwners['Email'] := edtEmail.Text;
           tblOwners['Password'] := edtPassword.Text;
           tblOwners.Post;

           SHowmessage('Your profile has been edited!');
         end;
         tblOwners.Next;
      end;
   end;

   if bAgent = true then
   begin
     tblAgents.First;
     while NOT tblAgents.EOF do
      begin
        if tblAgents['AgentID'] = iUserID then
         begin
           tblAgents.Edit;
           tblAgents['FirstName'] := edtName.Text;
           tblAgents['Surname'] := edtSurname.Text;
           tblAgents['CellphoneNumber']  := StrToInt(edtCell.Text);
           tblAgents['Email'] := edtEmail.Text;
           tblAgents['Password'] := edtPassword.Text;
           tblAgents['Rate'] := strtofloat(edtRate.text);
           tblAgents.Post;

           SHowmessage('Your profile has been edited!');
         end;
         tblAgents.Next;
      end;
   end;
 end;
end;

end.
