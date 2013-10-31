object ServerMethods2: TServerMethods2
  OldCreateOrder = False
  Height = 157
  Width = 285
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
      
        'Database=C:\Users\gilson.delima\Documents\GitHub\TxRxSnap\cbc.s3' +
        'db')
    Connected = True
    Left = 35
    Top = 20
  end
  object Concetradores: TSQLDataSet
    Active = True
    CommandText = 'Concetradores'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = CBC
    Left = 96
    Top = 16
  end
end
