object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'DataSnap Client'
  ClientHeight = 407
  ClientWidth = 655
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
    Left = 304
    Top = 24
    Width = 343
    Height = 336
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 144
    Width = 201
    Height = 57
    Caption = 'Get List of TCustomer'
    TabOrder = 2
    OnClick = Button2Click
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
end
