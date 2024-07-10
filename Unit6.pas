unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    edt9: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    lbl10: TLabel;
    edt10: TEdit;
    btn5: TButton;
    btn6: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure posisiawal;
    procedure bersih;
    procedure edt10Change(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  a: string;
implementation

uses Unit4, Unit8;

{$R *.dfm}

procedure TForm6.btn1Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('Nama Supplier Tidak Boleh Kosong!');
end else
if DataModule4.Zsupplier.Locate('name',edt1.Text,[]) then
begin
ShowMessage('Nama Supplier '+edt1.Text+' Sudah Ada Didalam Sistem');
end else

Begin // simpan
with DataModule4.Zsupplier do
begin
SQL.Clear;
SQL.Add('insert into supplier values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+edt9.Text+'")');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from supplier');
Open;
end;
ShowMessage('Data Berhasil Disimpan!');
end;
end;

procedure TForm6.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('Nama Supplier Tidak Boleh Kosong!');
end else

begin //kode update
with DataModule4.Zsupplier do
begin
SQL.Clear;
SQL.Add('update supplier set nik="'+edt1.text+'", name="'+edt2.text+'", telp="'+edt3.text+'", email="'+edt4.text+'", alamat="'+edt5.text+'", perusahaan="'+edt6.text+'", nama_bank="'+edt7.text+'", nama_akun_bank="'+edt8.text+'", no_akun_bank="'+edt9.text+'" where id= "'+a+'"');
ExecSQL;
SQL.Clear;
SQL.Add('select * from supplier');
Open;
end;
ShowMessage('Data Berhasil Diupdate!');
end;
posisiawal;
end;

procedure TForm6.btn3Click(Sender: TObject);
begin  //kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule4.Zsupplier do
begin
SQL.Clear;
SQL.Add('delete from supplier where id= "'+a+'"');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from supplier');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin
ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm6.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text := DataModule4.Zsupplier.Fields[1].AsString;
edt2.Text := DataModule4.Zsupplier.Fields[2].AsString;
edt3.Text := DataModule4.Zsupplier.Fields[3].AsString;
edt4.Text := DataModule4.Zsupplier.Fields[4].AsString;
edt5.Text := DataModule4.Zsupplier.Fields[5].AsString;
edt6.Text := DataModule4.Zsupplier.Fields[6].AsString;
edt7.Text := DataModule4.Zsupplier.Fields[7].AsString;
edt8.Text := DataModule4.Zsupplier.Fields[8].AsString;
edt9.Text := DataModule4.Zsupplier.Fields[9].AsString;
a:= DataModule4.Zsupplier.Fields[0].AsString;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
edt7.Enabled:= True;
edt8.Enabled:= True;
edt9.Enabled:= True;
btn2.Enabled:= True;
btn3.Enabled:= True;
btn5.Enabled:= True;
btn6.Enabled:= False;
btn1.Enabled:= False;
end;

procedure TForm6.posisiawal;
begin
btn6.Enabled:= True;
btn1.Enabled:= false;
btn2.Enabled:= false;
btn5.Enabled:= false;
btn3.Enabled:= false;
edt1.Clear;
edt1.Enabled:= false;
edt2.Clear;
edt2.Enabled:= false;
edt3.Clear;
edt3.Enabled:= false;
edt4.Clear;
edt4.Enabled:= false;
edt5.Clear;
edt5.Enabled:= false;
edt6.Clear;
edt6.Enabled:= false;
edt7.Clear;
edt7.Enabled:= false;
edt8.Clear;
edt8.Enabled:= false;
edt9.Clear;
edt9.Enabled:= false;
end;

procedure TForm6.edt10Change(Sender: TObject);
begin
with DataModule4.Zsupplier do
begin
  SQL.Clear;
  SQL.Add('select * from supplier where name like "%'+edt10.Text+'%"');
  Open;
end;
end;

procedure TForm6.btn4Click(Sender: TObject);
begin
form8.frxReport3.showReport();
end;

procedure TForm6.btn5Click(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm6.btn6Click(Sender: TObject);
begin
btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
btn6.Enabled:= False;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
edt7.Enabled:= True;
edt8.Enabled:= True;
edt9.Enabled:= True;
end;

procedure TForm6.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt6.Clear;
edt7.Clear;
edt8.Clear;
edt9.Clear;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

end.
