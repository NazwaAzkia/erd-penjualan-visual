object Form5: TForm5
  Left = 487
  Top = 181
  Width = 637
  Height = 377
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 40
    Top = 24
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl2: TLabel
    Left = 40
    Top = 56
    Width = 52
    Height = 13
    Caption = 'DESKRIPSI'
  end
  object lbl3: TLabel
    Left = 40
    Top = 280
    Width = 86
    Height = 13
    Caption = 'MASUKKAN NAMA'
  end
  object edt1: TEdit
    Left = 104
    Top = 24
    Width = 489
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 104
    Top = 56
    Width = 489
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 136
    Top = 96
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 232
    Top = 96
    Width = 75
    Height = 25
    Caption = 'UBAH'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 328
    Top = 96
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = btn3Click
  end
  object dbgrd1: TDBGrid
    Left = 40
    Top = 144
    Width = 553
    Height = 120
    DataSource = DataModule4.dssatuan
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt3: TEdit
    Left = 136
    Top = 280
    Width = 457
    Height = 21
    TabOrder = 6
    OnChange = edt3Change
  end
  object btn5: TButton
    Left = 40
    Top = 96
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 7
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 424
    Top = 96
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 8
    OnClick = btn6Click
  end
  object btn4: TButton
    Left = 520
    Top = 96
    Width = 75
    Height = 25
    Caption = 'LAPORAN'
    TabOrder = 9
    OnClick = btn4Click
  end
end
