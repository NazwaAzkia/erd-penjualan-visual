unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm3 = class(TForm)
    e1: TEdit;
    Label1: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl1: TLabel;
    edt2: TEdit;
    dbgrd1: TDBGrid;
    btn5: TButton;
    btn6: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt2Change(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses Unit4, Unit8;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
if e1.Text = '' then
begin
ShowMessage('Nama Kategori Tidak Boleh Kosong!');
end else
if DataModule4.Zkategori.Locate('name',e1.Text,[]) then
begin
ShowMessage('Nama Kategori '+e1.Text+' Sudah Ada Didalam Sistem');
end else
Begin // simpan
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('insert into kategori values(null,"'+e1.Text+'")');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil Disimpan!');
end;
posisiawal;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
if e1.Text = '' then
begin
ShowMessage('Nama Kategori Tidak Boleh Kosong!');
end else
if e1.Text = DataModule4.Zkategori.Fields[1].AsString then
begin
ShowMessage('Nama Kategori '+e1.Text+' Tidak Ada Perubahan');
end else
begin //kode update
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('update kategori set name="'+e1.text+'" where id= "'+a+'"');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil Diupdate!');
end;
posisiawal;
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
e1.Text:= DataModule4.Zkategori.Fields[1].AsString;
a:= DataModule4.Zkategori.Fields[0].AsString;

e1.Enabled:= True;
btn2.Enabled:= True;
btn3.Enabled:=True;
btn5.Enabled:= True;
btn6.Enabled:= False;
btn1.Enabled:= False;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin //kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('delete from kategori where id= "'+a+'"');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kategori');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin
ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
form8.frxReport1.showReport();
end;

 

procedure TForm3.edt2Change(Sender: TObject);
begin
with DataModule4.Zkategori do
begin
SQL.Clear;
SQL.Add('select * from kategori where name like "%'+edt2.Text+'%"');
Open;
end;
end;

procedure TForm3.posisiawal;
begin
  btn6.Enabled:= True;
  btn1.Enabled:= false;
  btn2.Enabled:= false;
  btn5.Enabled:= false;
  btn3.Enabled:= false;
  e1.clear;
  e1.Enabled:= false;
end;

procedure TForm3.bersih;
begin
 e1.Clear;
end;

end.
