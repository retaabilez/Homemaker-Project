unit clsAgents_u;

interface

type TAgents = class(TObject)
 private
   fEmail: string;
 fPassword: string;
 fQualification: string;
 fFirstName: string;
 fSurname: string;
 fCellphone: integer;
 fRate: real;

 public
   Constructor create (sEmail, sPassword, sName, sSurname, sQualification : String;
   iCellphone : Integer; rRate: real);
   function CheckQualification (sQualification: string): boolean;

end;



implementation

{ TAgents }


function TAgents.CheckQualification (sQualification: string): boolean;
CONST sQualification1 = 'Real Estate License';
      sQualification2 = 'Certified Residential Specialist';
      sQualification3 = 'Certified Commercial Investment Member';
begin
   if (sQualification = sQualification1) OR (sQualification = sQualification2) OR (sQualification = sQualification3) then
   begin
     result := true;
   end
   else
   begin
     result := false;
   end;

end;

constructor TAgents.create(sEmail, sPassword, sName, sSurname,
  sQualification: String; iCellphone: Integer; rRate: real);
begin
  fEmail := sEmail;
  fPassword := sPassword;
  fFirstName := sName;
  fSurname := sSurname;
  fQualification := sQualification;
  fCellphone := iCellphone;
  fRate := rRate;
end;



end.
