object frmHelp: TfrmHelp
  Left = 0
  Top = 0
  Caption = 'frmHelp'
  ClientHeight = 538
  ClientWidth = 724
  Color = 15856627
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnLoadHelp: TButton
    Left = 280
    Top = 488
    Width = 177
    Height = 25
    Caption = 'Load Help!'
    TabOrder = 0
    OnClick = btnLoadHelpClick
  end
  object wbrHelp: TWebBrowser
    Left = 8
    Top = 24
    Width = 708
    Height = 458
    TabOrder = 1
    ControlData = {
      4C000000C83000008F1F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
