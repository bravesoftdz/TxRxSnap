object Form12: TForm12
  Left = 0
  Top = 0
  BorderWidth = 10
  Caption = 'DataSnap Client - Experiments using ideas'
  ClientHeight = 497
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 48
    Width = 201
    Height = 57
    Caption = 'Get TCustomer'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MMCustomer: TMemo
    Left = 231
    Top = 24
    Width = 416
    Height = 249
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 111
    Width = 201
    Height = 57
    Caption = 'Get List of TCustomer'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 296
    Width = 635
    Height = 182
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 174
    Width = 201
    Height = 57
    Caption = 'List of Different Types'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 478
    Width = 635
    Height = 19
    Panels = <
      item
        Text = 'By Gilson DeLima -> gilson.delima@gmail.com'
        Width = 50
      end>
    ExplicitTop = 392
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 237
    Width = 201
    Height = 36
    Caption = 'BitBtn2'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DATASNAPCONNECTION'
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'drivername=DataSnap'
      'hostname=localhost'
      'port=211')
    Left = 448
    Top = 96
  end
  object myCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = myCliente
    Left = 136
    Top = 312
  end
end
