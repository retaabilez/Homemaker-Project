object dmProperty: TdmProperty
  Height = 566
  Width = 847
  PixelsPerInch = 144
  object conProperty: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Retaabile Zuzani\Documents\IT PAT 2024\dbHomemaker.mdb;Mode=' +
      'ReadWrite;Persist Security Info=False;Jet OLEDB:System database=' +
      '"";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet' +
      ' OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB' +
      ':Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;' +
      'Jet OLEDB:New Database Password="";Jet OLEDB:Create System Datab' +
      'ase=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy ' +
      'Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair' +
      '=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 144
    Top = 200
  end
  object tblProperty: TADOTable
    Active = True
    Connection = conProperty
    CursorType = ctStatic
    TableName = 'tblProperty'
    Left = 384
    Top = 216
  end
  object dscProperty: TDataSource
    DataSet = tblProperty
    Left = 608
    Top = 208
  end
end
