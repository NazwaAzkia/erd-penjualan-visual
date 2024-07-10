object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 192
  Top = 144
  Height = 375
  Width = 551
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Properties.Strings = (
      'select * from kategori'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = '2210010396_nazwaazkia_erdpenjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\ASUS\Downloads\libmysql.dll'
    Left = 32
    Top = 16
  end
  object Zkategori: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Properties.Strings = (
      'select * from kategori')
    Left = 96
    Top = 16
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 152
    Top = 16
  end
  object Zsatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 96
    Top = 64
  end
  object dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 152
    Top = 64
  end
  object Zsupplier: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from supplier')
    Params = <>
    Properties.Strings = (
      '')
    Left = 96
    Top = 120
  end
  object dssupplier: TDataSource
    DataSet = Zsupplier
    Left = 152
    Top = 120
  end
  object Zkustomer: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 96
    Top = 168
  end
  object dskustomer: TDataSource
    DataSet = Zkustomer
    Left = 152
    Top = 168
  end
end
