unit dmProperty_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmProperty = class(TDataModule)
    conProperty: TADOConnection;
    tblProperty: TADOTable;
    dscProperty: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProperty: TdmProperty;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
