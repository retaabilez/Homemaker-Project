unit Upload_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmUpload = class(TForm)
    edtMin: TEdit;
    edtMax: TEdit;
    cbxProvince: TComboBox;
    edtSquareMeters: TEdit;
    edtAddress: TEdit;
    spnGarage: TSpinEdit;
    spnAge: TSpinEdit;
    spnBedroom: TSpinEdit;
    spnBathroom: TSpinEdit;
    lblBathrooms: TLabel;
    lblGarages: TLabel;
    lblBedrooms: TLabel;
    lblAge: TLabel;
    lblMaxPrice: TLabel;
    edtCity: TEdit;
    lblMinPrice: TLabel;
    lblCity: TLabel;
    lblSquareMeters: TLabel;
    lblAddress: TLabel;
    pnlExit: TPanel;
    pnlUpload: TPanel;
    edtPostalCode: TEdit;
    lblPostalCode: TLabel;
    redAdditionalNotes: TRichEdit;
    lblPropertyType: TLabel;
    edtPropertyType: TEdit;
    lblPool: TLabel;
    edtPool: TEdit;
    imgIcon: TImage;
    imgBackground: TImage;
    procedure pnlExitClick(Sender: TObject);
    procedure pnlUploadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpload: TfrmUpload;

implementation

{$R *.dfm}

uses dmProperty_u, Login_u, Home_u;

procedure TfrmUpload.FormCreate(Sender: TObject);
var k : integer;
begin
 for k := 1 to 9 do
  begin
    cbxProvince.Items.Add(arrProvinces[k]);
  end;

  imgBackground.SendToBack;

end;

procedure TfrmUpload.pnlExitClick(Sender: TObject);
begin
if MessageDlg('Are you sure you want to leave?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then   // if the user wishes to abandon the process of uploading a property
  begin
    frmUpload.Hide;
    frmLogin.SHow;
  end;

end;

procedure TfrmUpload.pnlUploadClick(Sender: TObject);
begin
 with dmProperty do
 begin


  tblProperty.Append;
  tblProperty['OwnerID'] := iUserID; // this carries the value of the owner ID from Login_u
  tblProperty['Address'] := edtAddress.Text;
  tblProperty['PropertyType'] := edtPropertyType.Text;
  tblProperty['EstimatedMin'] := edtMin.Text;
  tblProperty['EstimatedMax'] := edtMax.Text;
  tblProperty['Bedrooms'] := spnBedroom.Value;
  tblProperty['Bathrooms'] := spnBathroom.Value;
  tblProperty['Pool'] := edtPool.Text;
  tblProperty['Garages'] := spnGarage.Value;
  tblProperty['SquareMeters'] := StrToInt(edtSquareMeters.Text);
  tblProperty['City'] := edtCity.Text;
  tblProperty['Province'] := cbxProvince.Items[cbxProvince.ItemIndex];
  tblProperty['Age'] := spnAge.Value;
  tblProperty['AdditionalNotes'] := redAdditionalNotes.Lines.Text;
  tblProperty.Post;

  Showmessage('Property has been successfully uploaded!');
 end;
end;

end.
