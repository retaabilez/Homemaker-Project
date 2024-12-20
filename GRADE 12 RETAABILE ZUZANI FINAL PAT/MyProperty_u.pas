unit MyProperty_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, clsCommissions_u,
  Vcl.Imaging.pngimage;

type
  TfrmMyProperty = class(TForm)
    dbgMyProperty: TDBGrid;
    pnlExit: TPanel;
    pnlOffers: TPanel;
    pnlEditProperty: TPanel;
    pnlCalculateCommission: TPanel;
    pnlExtract: TPanel;
    redOutput: TRichEdit;
    lblHelp: TLabel;
    pnlFilter: TPanel;
    imgFront: TImage;
    procedure pnlOffersClick(Sender: TObject);
    procedure pnlCalculateCommissionClick(Sender: TObject);
    procedure pnlFilterClick(Sender: TObject);
    procedure pnlExtractClick(Sender: TObject);
    procedure pnlEditPropertyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMyProperty: TfrmMyProperty;
  iPos, iSelectedPropertyID, iAgentID: Integer;
  // the ID of the property selected by the user
  sOneline: String;
  // will store the line of information we're attempting to decipher
  sPropertyID, sAgentID: STring;
  rMinPrice, rMaxPrice, rRAte: Real;

  objCommissions: TCommissions;

implementation

{$R *.dfm}

uses dmHomemaker_u, dmProperty_u, Login_u, Home_u;

procedure TfrmMyProperty.FormCreate(Sender: TObject);
begin
 redOutput.Paragraph.TabCount := 1;
 redOutput.Paragraph.Tab[0] := 50;
 redOutput.Paragraph.Tab[1] := 150;
 redOutput.Lines.Add('PropertyID: ' + #9 + 'AgentID');
end;

procedure TfrmMyProperty.pnlCalculateCommissionClick(Sender: TObject);
var
  rMinComm, rMaxComm: Real;
begin
 if Assigned(objCommissions) then  // if objCommissions has been assigned and the class file has been created
 begin
   rMinComm := objCommissions.CalculateMinCommission;
  rMaxComm := objCommissions.CalculateMaxCommission;
  redOutput.Lines.Add('Estimated Minimum Commission: ' + FloatToSTrF(rMinComm,
    ffCurrency, 8, 2));
  redOutput.Lines.Add('Estimated Maximum Commission: ' + FloatToSTrF(rMaxComm,
    ffCurrency, 8, 2));
 end
 else
 begin
   Showmessage('This object has not been instantiated');
 end;


end;

procedure TfrmMyProperty.pnlEditPropertyClick(Sender: TObject);
begin
  with dmProperty do
  begin
    tblProperty.edit;
    tblProperty['OwnerID'] := iUserID;
    tblProperty['Address'] := InputBox('Put in your new address',
      'Address:', '');
    tblProperty['PropertyType'] := InputBox('Put in the property type',
      'Property Type:', '');
    tblProperty['EstimatedMin'] :=
      StrToFloat(InputBox('Put in your new address', 'Address:', ''));
    tblProperty['EstimatedMax'] :=
      StrToFloat(InputBox('Put in your new address', 'Address:', ''));
    tblProperty['Bedrooms'] :=
      StrToInt(InputBox('Put in the number of bedrooms',
      'Number of bedrooms:', ''));
    tblProperty['Bathrooms'] :=
      StrToInt(InputBox('Put in the number of bathrooms',
      'Number of bathrooms:', ''));
    tblProperty['Pool'] := InputBox('Put in if there is a pool or not',
      'Pool (true or false):', '');
    tblProperty['Garages'] := StrToInt(InputBox('Put in the number of garages',
      'Number of garages:', ''));
    tblProperty['SquareMeters'] :=
      StrToInt(InputBox('Put in the number of square meters',
      'Square Meters:', ''));
    tblProperty['City'] := InputBox('Put in the city', 'City:', '');
    tblProperty['Province'] := InputBox('Put in the province', 'Province:', '');
    tblProperty['Age'] := StrToInt(InputBox('Put in the age of your property',
      'Age:', ''));
    tblProperty['AdditionalNotes'] := InputBox('Any additional notes?',
      'Additional notes:', '');
    tblProperty.Post;
  end;

end;

procedure TfrmMyProperty.pnlExtractClick(Sender: TObject);
var
  sName, sSurname: String;
  iCell: Integer;
begin
  with dmHomemaker do
  begin
    tblAgents.First;
    while NOT tblAgents.EOF do
    begin
      if tblAgents['AgentID'] = StrToInt(sAgentID) then
      begin
        redOutput.Lines.Add('Agent Name and Surname: ' + tblAgents['FirstName']
          + ' ' + tblAgents['Surname']);
        redOutput.Lines.Add('Email Address: ' + tblAgents['Email']);
        redOutput.Lines.Add('Cellphone: ' + tblAgents['CellphoneNumber']);
      end;
    end;
  end;
end;

procedure TfrmMyProperty.pnlFilterClick(Sender: TObject);
begin
  with dmProperty do
  begin
    tblProperty.Filtered := False;
    tblProperty.Filter := 'OwnerID = ' + IntToStr(iUserID);
    // this only shows the property uploaded under the logged in user's ID
    tblProperty.Filtered := True;
  end;
end;

procedure TfrmMyProperty.pnlOffersClick(Sender: TObject);
var
  tPropertyOffers: Textfile;
  // this is for the textfiles storing the offers (the same textfile being used in frmHome, under the 'Make Offer' Button)
begin
  // here, the textfile 'Offers.txt' is being read from to access who has made offers
  // to try and sell selected property
  // format of textfile lines: PropertyID#AgentID
  // input
  iSelectedPropertyID := dmProperty.tblProperty['PropertyID'];
  rMinPrice := dmProperty.tblProperty['EstimatedMin'];
  rMaxPrice := dmProperty.tblProperty['EstimatedMax'];
  rRAte := dmHomemaker.tblAgents['Rate'];

  // processing
  if FileExists('Offers.txt') = False then
  begin
    Showmessage('Textfile does not exist');
    // precautionary action: in case the textfile doesnt exist
    Exit;
  end;
  Assignfile(tPropertyOffers, 'Offers.txt');
  Reset(tPropertyOffers);

  while NOT EOF(tPropertyOffers) do
  begin
    ReadLn(tPropertyOffers, sOneline);

    iPos := Pos('#', sOneline);
    sPropertyID := Copy(sOneline, 1, iPos - 1);
    Delete(sOneline, 1, iPos);

    sAgentID := sOneline;

    if StrToInt(sPropertyID) = iSelectedPropertyID then
    // if the propertyID matches the one stored in the textfile
    begin
      redOutput.Lines.Add(sPropertyID + #9 + sAgentID);
    end;
  end;
  closefile(tPropertyOffers);

  iAgentID := StrToInt(sAgentID);
  // this is to be used for the class object (instantiating it and working with the value of the agentID)

  // the creating of the object
  objCommissions := TCommissions.Create(iAgentID, iSelectedPropertyID,
    rMinPrice, rMaxPrice, rRAte);
end;

end.
