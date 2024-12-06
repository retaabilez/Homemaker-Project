unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Samples.Spin, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, dmHomemaker_u, Vcl.DBCtrls, upload_u;

type
  TfrmHome = class(TForm)
    btnPersonal: TButton;
    cbxProvince: TComboBox;
    btnUpload: TButton;
    btnView: TButton;
    btnReview: TButton;
    dbgProperty: TDBGrid;
    pnlExit: TPanel;
    pnlOffer: TPanel;
    lblFilterBy: TLabel;
    btnBedrooms: TButton;
    btnBathrooms: TButton;
    btnGarages: TButton;
    btnCity: TButton;
    btnMinMax: TButton;
    btnPool: TButton;
    lblHelp: TLabel;
    imgFront: TImage;
    btnDelete: TButton;
    btnOrder: TButton;
    btnSearchType: TButton;
    cbxPropertyType: TComboBox;
    btnSearchBy: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure pnlOfferClick(Sender: TObject);
    procedure pnlExitClick(Sender: TObject);
    procedure btnPersonalClick(Sender: TObject);
    procedure btnReviewClick(Sender: TObject);
    procedure btnBedroomsClick(Sender: TObject);
    procedure btnBathroomsClick(Sender: TObject);
    procedure btnGaragesClick(Sender: TObject);
    procedure btnCityClick(Sender: TObject);
    procedure btnMinMaxClick(Sender: TObject);
    procedure btnPoolClick(Sender: TObject);
    procedure lblHelpClick(Sender: TObject);
    procedure btnProvinceClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOrderClick(Sender: TObject);
    procedure btnSearchByClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;
  arrProvinces: Array[1..9] of String = ('Eastern Cape', 'Western Cape', 'Gauteng', 'Limpopo', 'Kwa-Zulu Natal', 'Northern Cape', 'North West', 'Free State', 'Mpumalanga')   ; // the array storing the provinces
implementation

{$R *.dfm}

uses Login_u, Profile_u, Help_u, MyProperty_u;

procedure TfrmHome.btnBathroomsClick(Sender: TObject);
var sBathrooms : String; // in string format because it will be used in an sql query
begin
 // input: this collects the number of bathrooms the user is searching for
 sBathrooms := (InputBox('Search by Bathrooms', 'Enter the number of bathrooms to search for',''));

 // processing: making use of the ADOquery to search for the parameter
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty WHERE Bathrooms = ' + sBathrooms);
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnBedroomsClick(Sender: TObject);
var sBedrooms : string;  // this will store the value of the number of bedrooms searched for
begin

 // input: this collects the number of bedrooms the user is searching for
 sBedrooms := (InputBox('Search by bedrooms', 'Enter the number of bedrooms to search for',''));

 // processing
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty WHERE Bedrooms = ' + sBedrooms);
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnCityClick(Sender: TObject);
var sCity : string;  // this will store the value of the city searched for
begin

 // input: this collects the number of city the user is searching for
 sCity := (InputBox('Search by city', 'Enter the city to search for',''));

 // processing
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty WHERE Bedrooms = ' + sCity);
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnDeleteClick(Sender: TObject);
begin
  with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('DELETE FROM tblProperty WHERE (City = :City) OR (Province = :Province) OR (Address = :Address)');

  //ParamByName assigns blank values to the parameters set by the adoquery
    // assisted by chatgpt
  Parameters.ParamByName('City').Value := '';
  Parameters.ParamByName('Province').Value := '';
  Parameters.ParamByName('Address').Value := '';
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnExitClick(Sender: TObject);
begin
 frmHome.Hide;
 frmLogin.show;
end;

procedure TfrmHome.btnGaragesClick(Sender: TObject);
var sGarages : string;  // this will store the value of the number of garages searched for
begin

 // input: this collects the number of garages the user is searching for
 sGarages := (InputBox('Search by garages', 'Enter the number of garages to search for',''));

 // processing
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty WHERE Bedrooms = ' + sGarages);
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnMinMaxClick(Sender: TObject);
var sMinPrice, sMaxPrice, sSQLstring : string;  // this will store the minimum price and maximum price searched for respectively
begin

 // input: this collects the minimum and maximum prices the user is searching for
 sMinPrice := (InputBox('Search by price', 'Enter the minimum price to search for',''));
 sMaxPrice := (InputBox('Search by price', 'Enter the maximum price to search for',''));

 // processing
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    sSQLString := 'SELECT * FROM tblProperty WHERE EstimatedMin >= :MinPrice AND EstimatedMax <= :MaxPrice';
  SQL.Add(sSQLString);
  // ParamByName assigns the values of sMinPrice and sMaxPrice to the values set by the adoquery
    // assisted by chatgpt
  Parameters.ParamByName('MinPrice').Value := sMinPrice;
  Parameters.ParamByName('MaxPrice').Value := sMaxPrice;
  Active := True;
  end;
 end;
end;

procedure TfrmHome.btnOrderClick(Sender: TObject);
begin
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty ORDER BY EstimatedMin');
    Active := True;
  end;
 end;
end;

procedure TfrmHome.btnPersonalClick(Sender: TObject);
begin
 frmHome.Hide;
 frmProfile.Show;
end;

procedure TfrmHome.btnPoolClick(Sender: TObject);
var sPool : string;  // this will store the value of the number of garages searched for
begin

 // input: this collects the number of garages the user is searching for
 sPool := (InputBox('Search by pool', 'Enter true for a pool, enter false for no pool' ,''));

 // processing
 with dmHomemaker do
 begin
  with qryProperty do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM tblProperty WHERE Pool = ' + sPool);
    Active := True;
  end;
 end;
end;
procedure TfrmHome.btnProvinceClick(Sender: TObject);
var sType : STring;
begin
 sType :=  cbxPropertyType.Text ;
  with dmHomemaker do
 begin
   qryProperty.SQL.Clear;
   qryProperty.SQL.Add('SELECT * FROM tblProperty WHERE PropertyType = ' + sType);
   qryProperty.Open;
 end;
end;

procedure TfrmHome.btnReviewClick(Sender: TObject);
var sReview : STring;
    tReview : Textfile;
begin
 sReview := InputBox('Leave a review','Tell us what is on your mind',''); // this allows the user to put in what they wish to say in an inputbox

  Assignfile(tReview,'Reviews.txt');
  if fileexists('Reviews.txt') = False then
   begin
     Rewrite(tReview); // this creates the textfile if it doesnt already exist
   end;
   Append(tReview);
   WriteLn(tReview, sReview);
   closefile(tReview);

end;

procedure TfrmHome.btnSearchByClick(Sender: TObject);
var sProvince : STring;
begin
 sProvince :=  cbxProvince.Text ;
  with dmHomemaker do
 begin
   qryProperty.SQL.Clear;
   qryProperty.SQL.Add('SELECT * FROM tblProperty WHERE Province = ' + sProvince);
   qryProperty.Open;
 end;
end;

procedure TfrmHome.btnUploadClick(Sender: TObject);
begin
 if bAgent = True then
 begin
   MessageDlg('As an agent, you cannot upload your own property.', mtWarning, [mbOK], 0);
 end;

 if bOwner = true then
  begin
    frmHome.hide;
    frmUpload.show;
  end;
end;

procedure TfrmHome.btnViewClick(Sender: TObject);
begin
 frmHome.Hide;
 frmMyProperty.show;
end;

procedure TfrmHome.Button1Click(Sender: TObject);
begin
 with dmHomemaker do
 begin
   qryProperty.SQL.Clear;
   qryProperty.SQL.Add('SELECT * FROM tblProperty');
   qryProperty.Open;
 end;
end;

procedure TfrmHome.FormActivate(Sender: TObject);
begin
  lblHelp.BringToFront;
  lblFilterBy.BringToFront;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
var k : integer;
begin
 for k := 1 to 9 do
  begin
    cbxProvince.Items.Add(arrProvinces[k]);
  end;
end;

procedure TfrmHome.lblHelpClick(Sender: TObject);
begin
 frmHome.Hide;
 frmHelp.SHow;
end;

procedure TfrmHome.pnlExitClick(Sender: TObject);
begin
 frmHome.Hide;
 frmLogin.Show;
end;

procedure TfrmHome.pnlOfferClick(Sender: TObject);
var sLine : String; // will store the line of information to be put into the textfile
    tOffers: Textfile; // this is for the textfiles storing the offers
begin

 if bOwner = True then // this prevents any owners from attempting to make an offer
 begin
   MessageDlg('As an owner, you cannot make offers to sell other property.', mtWarning, [mbOK], 0);
 end;

// input - the textfile is being initialised

if bAgent = True then     // if the user is actually an agent
 begin
 // the agent's ID and the propertyID is stored in a textfile line

 Assignfile(tOffers,'Offers.txt');
   if NOT FileExists('Offers.txt') then
  begin
  Rewrite(tOffers);
  end;


  Append(tOffers);

  sLine := inttostr(dmHomemaker.qryProperty['PropertyID']) + '#' + IntToStr(iUserID);
  WriteLn(tOffers, sLine);
  CloseFile(tOffers);
  Showmessage('Offer made!');
 end;

end;

end.
