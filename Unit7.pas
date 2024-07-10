unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm7 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dbgrd1: TDBGrid;
    lbl5: TLabel;
    edt5: TEdit;
    btn5: TButton;
    btn6: TButton;
    btn4: TButton;
    lbl6: TLabel;
    edt6: TEdit;
    lbl7: TLabel;
    cbb1: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure edt5Change(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  a: string;
implementation

uses Unit4, Unit8;

{$R *.dfm}

procedure TForm7.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text := DataModule4.Zkustomer.Fields[1].AsString;
edt2.Text := DataModule4.Zkustomer.Fields[2].AsString;
edt3.Text := DataModule4.Zkustomer.Fields[3].AsString;
edt4.Text := DataModule4.Zkustomer.Fields[4].AsString;
edt6.Text := DataModule4.Zkustomer.Fields[5].AsString;
cbb1.Text := DataModule4.Zkustomer.Fields[6].AsString;
a:= DataModule4.Zkustomer.Fields[0].AsString;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt6.Enabled:= True;
cbb1.Enabled:= True;
btn2.Enabled:= True;
btn3.Enabled:= True;
btn5.Enabled:= True;
btn6.Enabled:= False;
btn1.Enabled:= False;
end;

procedure TForm7.btn1Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('Nama Kustomer Tidak Boleh Kosong!');
end else
if DataModule4.Zkustomer.Locate('name',edt1.Text,[]) then
begin
ShowMessage('Nama Kustomer '+edt1.Text+' Sudah Ada Didalam Sistem');
end else

Begin // simpan
with DataModule4.Zkustomer do
begin
SQL.Clear;
SQL.Add('insert into kustomer values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt6.Text+'","'+cbb1.Text+'")');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kustomer');
Open;
end;
ShowMessage('Data Berhasil Disimpan!');
end;
end;

procedure TForm7.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
ShowMessage('Nama Kustomer Tidak Boleh Kosong!');
end else

begin //kode update
with DataModule4.Zkustomer do
begin
SQL.Clear;
SQL.Add('update kustomer set nik="'+edt1.Text+'", name="'+edt2.Text+'",alamat="'+edt3.Text+'", telp="'+edt4.Text+'", email="'+edt6.Text+'", member="'+cbb1.Text+'" where id= "'+a+'"');
ExecSQL;
SQL.Clear;
SQL.Add('select * from kustomer');
Open;
end;
ShowMessage('Data Berhasil Diupdate!');
end;
posisiawal;
end;

procedure TForm7.btn3Click(Sender: TObject);
begin //kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule4.Zkustomer do
begin
SQL.Clear;
SQL.Add('delete from kustomer where id= "'+a+'"');
ExecSQL ;
SQL.Clear;
SQL.Add('select * from kustomer');
Open;
end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin
ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm7.btn4Click(Sender: TObject);
begin
form8.frxReport4.showReport();
end;

procedure TForm7.posisiawal;
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
edt6.Clear;
edt6.Enabled:= false;
end;

procedure TForm7.edt5Change(Sender: TObject);
begin
with DataModule4.Zsupplier do
begin
  SQL.Clear;
  SQL.Add('select * from kustomer where name like "%'+edt5.Text+'%"');
  Open;
end;
end;

procedure TForm7.btn6Click(Sender: TObject);
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
edt6.Enabled:= True;
cbb1.Enabled:= True;
end;
procedure TForm7.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt6.Clear;
end;

procedure TForm7.btn5Click(Sender: TObject);
begin
posisiawal;
bersih;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm7.cbb1Change(Sender: TObject);
begin
if cbb1.Text = 'Yes' then
lbl9.Caption := '10%'
else if cbb1.Text = 'No' then
lbl9.Caption := '5%'
end;

end.
