unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm5 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    edt3: TEdit;
    btn5: TButton;
    btn6: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure edt3Change(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  a: string;

implementation

uses Unit4, Unit8;

{$R *.dfm}

procedure TForm5.bersih;
begin
 edt1.Clear;
 edt2.Clear;
end;

procedure TForm5.btn1Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('Nama Satuan Tidak Boleh Kosong!');
end else
if DataModule4.Zsatuan.Locate('name',edt1.Text,[]) then
begin
ShowMessage('Nama Satuan '+edt1.Text+' Sudah Ada Didalam Sistem');
end else

Begin // simpan
with DataModule4.Zsatuan do
begin
SQL.Clear;
SQL.Add('insert into satuan values(null,"'+edt1.Text+'","'+edt2.Text+'")');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from satuan');
Open;
end;
ShowMessage('Data Berhasil Disimpan!');
end;
posisiawal;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
 if edt1.Text = '' then
begin
ShowMessage('Nama Satuan Tidak Boleh Kosong!');
end else


begin //kode update
with DataModule4.Zsatuan do
begin
SQL.Clear;
SQL.Add('update satuan set name="'+edt1.text+'", diskripsi="'+edt2.text+'" where id= "'+a+'"');
ExecSQL ;

SQL.Clear;
SQL.Add('select * from satuan');
Open;
end;
ShowMessage('Data Berhasil Diupdate!');
end;
posisiawal;
end;

procedure TForm5.btn3Click(Sender: TObject);
begin  //kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule4.Zsatuan do
begin
SQL.Clear;
SQL.Add('delete from satuan where id= "'+a+'"');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from satuan');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin
ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm5.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text:= DataModule4.Zsatuan.Fields[1].AsString;
edt2.Text:= DataModule4.Zsatuan.Fields[2].AsString;
a:= DataModule4.Zsatuan.Fields[0].AsString;
edt1.Enabled:= True;
edt2.Enabled:= True;
btn2.Enabled:= True;
btn3.Enabled:= True;
btn5.Enabled:= True;
btn6.Enabled:= False;
btn1.Enabled:= False;
end;

procedure TForm5.edt3Change(Sender: TObject);
begin
with DataModule4.Zsatuan do
begin
  SQL.Clear;
  SQL.Add('select * from satuan where name like "%'+edt3.Text+'%"');
  Open;
end;
end;

procedure TForm5.posisiawal;
begin
bersih;
btn6.Enabled:= false;
btn1.Enabled:= false;
btn2.Enabled:= false;
btn5.Enabled:= True;
btn3.Enabled:= false;
edt1.Clear;
edt1.Enabled:= false;
edt2.Clear;
edt2.Enabled:= false;
end;

procedure TForm5.btn5Click(Sender: TObject);
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
end;

procedure TForm5.btn6Click(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm5.btn4Click(Sender: TObject);
begin
form8.frxReport2.showReport();
end;

end.
