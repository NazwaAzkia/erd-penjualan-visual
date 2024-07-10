object Form7: TForm7
  Left = 494
  Top = 184
  Width = 625
  Height = 517
  Caption = 'KUSTOMER'
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
    Left = 48
    Top = 32
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object lbl2: TLabel
    Left = 48
    Top = 72
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl3: TLabel
    Left = 48
    Top = 112
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object lbl4: TLabel
    Left = 48
    Top = 152
    Width = 23
    Height = 13
    Caption = 'TELP'
  end
  object lbl5: TLabel
    Left = 48
    Top = 440
    Width = 86
    Height = 13
    Caption = 'MASUKKAN NAMA'
  end
  object lbl6: TLabel
    Left = 48
    Top = 192
    Width = 30
    Height = 13
    Caption = 'EMAIL'
  end
  object lbl7: TLabel
    Left = 48
    Top = 232
    Width = 41
    Height = 13
    Caption = 'MEMBER'
  end
  object lbl8: TLabel
    Left = 184
    Top = 232
    Width = 54
    Height = 13
    Caption = 'DISKON    :'
  end
  object lbl9: TLabel
    Left = 248
    Top = 232
    Width = 3
    Height = 13
  end
  object edt1: TEdit
    Left = 104
    Top = 32
    Width = 457
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 104
    Top = 72
    Width = 457
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 104
    Top = 112
    Width = 457
    Height = 21
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 104
    Top = 152
    Width = 457
    Height = 21
    TabOrder = 3
  end
  object btn1: TButton
    Left = 136
    Top = 264
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 4
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 224
    Top = 264
    Width = 75
    Height = 25
    Caption = 'UBAH'
    TabOrder = 5
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 312
    Top = 264
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 6
    OnClick = btn3Click
  end
  object dbgrd1: TDBGrid
    Left = 48
    Top = 304
    Width = 521
    Height = 120
    DataSource = DataModule4.dskustomer
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt5: TEdit
    Left = 144
    Top = 440
    Width = 425
    Height = 21
    TabOrder = 8
    OnChange = edt5Change
  end
  object btn5: TButton
    Left = 400
    Top = 264
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 9
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 48
    Top = 264
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 10
    OnClick = btn6Click
  end
  object btn4: TButton
    Left = 488
    Top = 264
    Width = 75
    Height = 25
    Caption = 'LAPORAN'
    TabOrder = 11
    OnClick = btn4Click
  end
  object edt6: TEdit
    Left = 104
    Top = 192
    Width = 457
    Height = 21
    TabOrder = 12
  end
  object cbb1: TComboBox
    Left = 104
    Top = 232
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    Text = '--PILIH--'
    OnChange = cbb1Change
    Items.Strings = (
      'Yes'
      'No')
  end
end
