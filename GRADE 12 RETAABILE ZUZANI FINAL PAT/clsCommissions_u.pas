unit clsCommissions_u;

interface

 uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Samples.Spin, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls;

type TCommissions = class(TObject)
 private
 fAgentID: integer;
 fMinPrice : real;
 fMaxPrice : real;
 fRate: real;
 fPropertyID : integer;
 public
  Constructor create (iAgentID, iPropertyID: Integer; rMinPrice, rMaxPrice, rRate: real);
   function CalculateMinCommission  : real;
   function CalculateMaxCommission  : real;
   function toString : String;
   procedure SetRate;
end;


implementation

{ TCommissions }

function TCommissions.CalculateMaxCommission: real;
begin
 result := fMaxPrice * fRate;
end;

function TCommissions.CalculateMinCommission: real;
begin
 result := fMinPrice * fRate;
end;

constructor TCommissions.create(iAgentID, iPropertyID: Integer; rMinPrice,
  rMaxPrice, rRate: real);
begin
 fAgentID := iAgentID;
 fPropertyID := iPropertyID;
 fMinPrice := rMinPrice;
 fMaxPrice := rMaxPrice;
 fRate := rRate;
end;

procedure TCommissions.SetRate;
begin
  fRate := fRate / 100;  // this puts the rate in its percentage form
end;

function TCommissions.toString: String;
var sLine : String;
begin
  sLine := 'Agent: '
end;

end.
