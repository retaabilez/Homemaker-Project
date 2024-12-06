unit dmHomemaker_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmHomemaker = class(TDataModule)
    conHomemaker: TADOConnection;
    tblAgents: TADOTable;
    tblOwners: TADOTable;
    dscAgents: TDataSource;
    dscOwners: TDataSource;
    qryProperty: TADOQuery;
    dscProperty: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmHomemaker: TdmHomemaker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
