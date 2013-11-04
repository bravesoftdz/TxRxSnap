object ServerMethods2: TServerMethods2
  OldCreateOrder = False
  Height = 176
  Width = 382
  object CBC: TSQLConnection
    ConnectionName = 'CBC'
    DriverName = 'SQLite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=SQLite'
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver190.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver180.bpl'
      'FailIfMissing=False'
      'Database=C:\Users\Amon\Documents\GitHub\TxRxSnap\cbc.s3db')
    Left = 35
    Top = 20
  end
  object Concetradores: TSQLDataSet
    CommandText = 'Concetradores'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = CBC
    Left = 120
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 16
  end
end
