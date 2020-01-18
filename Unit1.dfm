object Form1: TForm1
  Left = 355
  Top = 156
  Width = 654
  Height = 152
  Caption = 'led'#21160#24577#26174#31034
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object lbl1: TLabel
    Left = 56
    Top = 424
    Width = 12
    Height = 12
    Caption = 'ip'
    Visible = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 24
    Width = 120
    Height = 12
    Caption = #24038#36793#23631#24149#25968#25454#25991#20214#36335#24452
  end
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 120
    Height = 12
    Caption = #21491#36793#23631#24149#25968#25454#25991#20214#36335#24452
  end
  object Button1: TButton
    Left = 448
    Top = 24
    Width = 81
    Height = 41
    Caption = #35774#32622#23631#21442
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = -16
    Top = 408
    Width = 609
    Height = 41
    Caption = #19968#20010#33410#30446#19979#21482#26377#19968#20010#36830#25509#24038#31227#30340#21333#34892#25991#26412#21306#22495
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 536
    Top = 24
    Width = 81
    Height = 41
    Caption = #30452#25509#26174#31034
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 16
    Top = 400
    Width = 609
    Height = 41
    Caption = #19968#20010#33410#30446#19979#21482#26377#19968#20010#22270#29255#21306'('#34920#26684#30340#26174#31034#36890#36807#33258#32472#22270#29255#24182#36890#36807#27492#26041#24335#28155#21152#21457#36865')'
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = -8
    Top = 408
    Width = 609
    Height = 41
    Caption = #19968#20010#33410#30446#19979#26377#19968#20010#36830#32493#24038#31227#30340#21333#34892#25991#26412#21306#21644#19968#20010#25968#23383#26102#38047#21306'('#22810#20010#21306#22495#37117#36890#36807#27492#26041#27861#28155#21152')'
    TabOrder = 4
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 0
    Top = 432
    Width = 609
    Height = 41
    Caption = #20004#20010#33410#30446#19979#21508#26377#19968#20010#21333#34892#25991#26412#21306#21644#19968#20010#25968#23383#26102#38047#21306'('#22810#33410#30446#36890#36807#27492#26041#27861#28155#21152')'
    TabOrder = 5
    Visible = False
    OnClick = Button6Click
  end
  object Memo1: TMemo
    Left = 12
    Top = 363
    Width = 601
    Height = 113
    Lines.Strings = (
      #25552#31034#65306#27599#20010#25353#38062#19979#21151#33021#20195#30721#37117#26159#29420#31435#30340#65292#20114#19981#24433#21709#65292#21487#26681#25454#33258#24049#30340#38656#27714#36873#25321#24615#21435#30475#24182#26356#25913#20854#20013#30340#20195#30721#20026#24049#29992#12290#20195
      #30721#38468#35814#32454#30340#27880#31034#35828#26126#65292#22914#38656'demo'#37324#27809#26377#21015#20986#30340#21151#33021#65292#35831#26597#30475'LedDll.h'#25991#20214#65292#20869#26377#20989#25968#30340#35814#32454#35828#26126','#26377#20160#20040#19981#26126#30333#21152
      'QQ 2355291262')
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object edt1: TEdit
    Left = 96
    Top = 416
    Width = 121
    Height = 20
    TabOrder = 7
    Text = '192.168.1.187'
    Visible = False
  end
  object leftFile: TAdvFileNameEdit
    Left = 152
    Top = 20
    Width = 185
    Height = 20
    EmptyTextStyle = []
    Flat = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    ReadOnly = False
    TabOrder = 8
    Visible = True
    OnChange = leftFileChange
    Version = '1.3.5.0'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
      00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
      00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
      0000DDDDD0DDD0D00000DDDDDD000DDD0000}
    FilterIndex = 0
    DialogOptions = []
    DialogKind = fdOpen
  end
  object rightFile: TAdvFileNameEdit
    Left = 152
    Top = 52
    Width = 185
    Height = 20
    EmptyTextStyle = []
    Flat = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    ReadOnly = False
    TabOrder = 9
    Visible = True
    OnChange = rightFileChange
    Version = '1.3.5.0'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
      00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
      00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
      0000DDDDD0DDD0D00000DDDDDD000DDD0000}
    FilterIndex = 0
    DialogOptions = []
    DialogKind = fdOpen
  end
  object btn1: TButton
    Left = 360
    Top = 24
    Width = 75
    Height = 41
    Caption = #21551#21160
    TabOrder = 10
    OnClick = btn1Click
  end
  object con1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=G:\'#20845#20195#21333#21452 +
      #33394#21450#38376#26979#20840#24425#20135#21697#24320#21457#36164#26009'201711 (1)\'#20845#20195#21333#21452#33394#21450#38376#26979#20840#24425#20135#21697#24320#21457#36164#26009'201711\SDK and Demo(6.0)\' +
      'Demo(delphi)\PJ201905.mdb;Persist Security Info=True'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 312
    Top = 248
  end
  object qry1: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 288
    Top = 296
  end
  object con2: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=G:\'#20845#20195#21333#21452 +
      #33394#21450#38376#26979#20840#24425#20135#21697#24320#21457#36164#26009'201711 (1)\'#20845#20195#21333#21452#33394#21450#38376#26979#20840#24425#20135#21697#24320#21457#36164#26009'201711\SDK and Demo(6.0)\' +
      'Demo(delphi)\PJ201905.mdb;Persist Security Info=True'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 400
    Top = 256
  end
  object qry2: TADOQuery
    Connection = con2
    Parameters = <>
    Left = 392
    Top = 304
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 20000
    OnTimer = tmr1Timer
    Left = 312
    Top = 96
  end
  object con3: TADOConnection
    Left = 312
    Top = 64
  end
  object con4: TADOConnection
    Left = 384
    Top = 64
  end
  object qry3: TADOQuery
    Connection = con3
    Parameters = <>
    Left = 320
    Top = 72
  end
  object qry4: TADOQuery
    Connection = con4
    Parameters = <>
    Left = 416
    Top = 80
  end
end
