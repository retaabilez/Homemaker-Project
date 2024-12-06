object dmHomemaker: TdmHomemaker
  Height = 487
  Width = 722
  PixelsPerInch = 144
  object conHomemaker: TADOConnection
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
  object tblAgents: TADOTable
    Active = True
    Connection = conHomemaker
    CursorType = ctStatic
    TableName = 'tblAgents'
    Left = 304
    Top = 176
  end
  object tblOwners: TADOTable
    Active = True
    Connection = conHomemaker
    CursorType = ctStatic
    TableName = 'tblOwners'
    Left = 304
    Top = 64
  end
  object dscAgents: TDataSource
    DataSet = tblAgents
    Left = 440
    Top = 176
  end
  object dscOwners: TDataSource
    DataSet = tblOwners
    Left = 440
    Top = 64
  end
  object qryProperty: TADOQuery
    Active = True
    Connection = conHomemaker
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblProperty;')
    Left = 304
    Top = 288
  end
  object dscProperty: TDataSource
    DataSet = qryProperty
    Left = 432
    Top = 288
  end
end
