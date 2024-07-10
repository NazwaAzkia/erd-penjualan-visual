object Form3: TForm3
  Left = 490
  Top = 180
  Width = 681
  Height = 378
  Caption = 'KATEGORI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 56
    Width = 28
    Height = 13
    Caption = 'NAME'
  end
  object lbl1: TLabel
    Left = 80
    Top = 280
    Width = 79
    Height = 13
    Caption = 'MASUKAN NAME'
  end
  object e1: TEdit
    Left = 128
    Top = 56
    Width = 377
    Height = 21
    TabOrder = 0
  end
  object btn1: TButton
    Left = 168
    Top = 88
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 256
    Top = 88
    Width = 75
    Height = 25
    Caption = 'UBAH'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 344
    Top = 88
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 3
    OnClick = btn3Click
  end
  object edt2: TEdit
    Left = 168
    Top = 280
    Width = 337
    Height = 21
    TabOrder = 4
    OnChange = edt2Change
  end
  object dbgrd1: TDBGrid
    Left = 80
    Top = 136
    Width = 425
    Height = 120
    DataSource = DataModule4.dskategori
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object btn5: TButton
    Left = 80
    Top = 88
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 6
  end
  object btn6: TButton
    Left = 432
    Top = 88
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 7
  end
  object btn4: TButton
    Left = 520
    Top = 88
    Width = 75
    Height = 25
    Caption = 'LAPORAN'
    TabOrder = 8
    OnClick = btn4Click
  end
end
