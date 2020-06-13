unit trips;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Math, Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  Ttrips_f = class(TForm)
    r1: TRadioButton;
    r2: TRadioButton;
    r3: TRadioButton;
    r4: TRadioButton;
    r5: TRadioButton;
    r6: TRadioButton;
    r7: TRadioButton;
    r8: TRadioButton;
    r9: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ComboBox1: TComboBox;
    Label21: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    Button1: TButton;
    classbox: TComboBox;
    Label22: TLabel;
    busbox1: TComboBox;
    Label23: TLabel;
    header: TImage;
    bottom: TImage;
    mnmz: TImage;
    cls: TImage;
    TrayIcon1: TTrayIcon;
    procedure r1Click(Sender: TObject);
    procedure r2Click(Sender: TObject);
    procedure r3Click(Sender: TObject);
    procedure r6Click(Sender: TObject);
    procedure r4Click(Sender: TObject);
    procedure r5Click(Sender: TObject);
    procedure r9Click(Sender: TObject);
    procedure r7Click(Sender: TObject);
    procedure r8Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure busbox1Change(Sender: TObject);
    procedure classboxChange(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure clsClick(Sender: TObject);
    procedure mnmzClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  trips_f: Ttrips_f;

implementation

{$R *.dfm}

uses tables, main, user_input;


procedure Ttrips_f.FormShow(Sender: TObject);
begin
  AnimateWindow(Handle, 250, AW_BLEND or AW_SLIDE);
end;

procedure Ttrips_f.mnmzClick(Sender: TObject);
begin
AnimateWindow(Handle, 250, aw_blend or aw_hide);
Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.Hint:='Trips (Click!)';
  TrayIcon1.BalloonTitle:='Trips';
  TrayIcon1.BalloonHint:='Icon will appear in your tray';
  TrayIcon1.ShowBalloonHint;
end;

procedure Ttrips_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AnimateWindow(Handle, 250, aw_blend or aw_hide);
end;

procedure Ttrips_f.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;


procedure Ttrips_f.r1Click(Sender: TObject);
var r1_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r1_id:=Random(1000);
    end;
usr_inpt.l1.Caption:=IntToStr(r1_id);
end;

procedure Ttrips_f.ComboBox1Change(Sender: TObject);
begin
usr_inpt.p1.Caption:=Combobox1.Text;
end;

procedure Ttrips_f.Button1Click(Sender: TObject);
begin
combobox1.Items.Delete(ComboBox1.ItemIndex);
combobox2.Items.Delete(ComboBox2.ItemIndex);
combobox3.Items.Delete(ComboBox3.ItemIndex);
combobox4.Items.Delete(ComboBox4.ItemIndex);
combobox5.Items.Delete(ComboBox5.ItemIndex);
combobox6.Items.Delete(ComboBox6.ItemIndex);
combobox7.Items.Delete(ComboBox7.ItemIndex);
combobox8.Items.Delete(ComboBox8.ItemIndex);
combobox9.Items.Delete(ComboBox9.ItemIndex);
if r1.Checked then  usr_inpt.Label5.Caption:=' "Братск - Иркутск"';
if r2.Checked then  usr_inpt.Label5.Caption:=' "Братск - Красноярск"';
if r3.Checked then  usr_inpt.Label5.Caption:=' "Братск - Новосибирск"';
if r4.Checked then  usr_inpt.Label5.Caption:=' "Иркутск - Красноярск"';
if r5.Checked then  usr_inpt.Label5.Caption:=' "Иркутск - Новосибирск"';
if r6.Checked then  usr_inpt.Label5.Caption:=' "Иркутск - Москва"';
if r7.Checked then  usr_inpt.Label5.Caption:=' "Красноярск - Москва"';
if r8.Checked then  usr_inpt.Label5.Caption:=' "Красноярск - Новосибирск"';
if r9.Checked then  usr_inpt.Label5.Caption:=' "Новосибирск - Москва"';
trips_f.Close;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r2Click(Sender: TObject);
var r2_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r2_id:=Random(1000);
    end;
usr_inpt.l2.Caption:=IntToStr(r2_id);
end;

procedure Ttrips_f.ComboBox2Change(Sender: TObject);
begin
usr_inpt.p2.Caption:=Combobox2.Text;
end;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r3Click(Sender: TObject);
var r3_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r3_id:=Random(1000);
    end;
usr_inpt.l3.Caption:=IntToStr(r3_id);
end;

procedure Ttrips_f.ComboBox3Change(Sender: TObject);
begin
usr_inpt.p3.Caption:=Combobox3.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r4Click(Sender: TObject);
var r4_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r4_id:=Random(1000);
    end;
usr_inpt.l4.Caption:=IntToStr(r4_id);
end;

procedure Ttrips_f.ComboBox4Change(Sender: TObject);
begin
usr_inpt.p4.Caption:=Combobox4.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r5Click(Sender: TObject);
var r5_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r5_id:=Random(1000);
    end;
usr_inpt.l5.Caption:=IntToStr(r5_id);
end;

procedure Ttrips_f.ComboBox5Change(Sender: TObject);
begin
usr_inpt.p5.Caption:=Combobox5.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r6Click(Sender: TObject);
var r6_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r6_id:=Random(1000);
    end;
usr_inpt.l6.Caption:=IntToStr(r6_id);
end;

procedure Ttrips_f.ComboBox6Change(Sender: TObject);
begin
usr_inpt.p6.Caption:=Combobox6.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r7Click(Sender: TObject);
var r7_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r7_id:=Random(1000);
    end;
usr_inpt.l7.Caption:=IntToStr(r7_id);
end;

procedure Ttrips_f.ComboBox7Change(Sender: TObject);
begin
usr_inpt.p7.Caption:=Combobox7.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r8Click(Sender: TObject);
var r8_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r8_id:=Random(1000);
    end;
usr_inpt.l8.Caption:=IntToStr(r8_id);
end;

procedure Ttrips_f.ComboBox8Change(Sender: TObject);
begin
usr_inpt.p8.Caption:=Combobox8.Text;
end;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

procedure Ttrips_f.r9Click(Sender: TObject);
var r9_id,i :integer;
begin
usr_inpt.Button1.Enabled:=True;
randomize;
  for i := 1 to 5 do
    begin
    r9_id:=Random(1000);
    end;
usr_inpt.l9.Caption:=IntToStr(r9_id);
end;

procedure Ttrips_f.ComboBox9Change(Sender: TObject);
begin
usr_inpt.p9.Caption:=Combobox9.Text;
end;





///////////////////////тип автобуса////////////////////////////////////////////////////////


procedure Ttrips_f.busbox1Change(Sender: TObject);
begin
case busbox1.ItemIndex of
 0: usr_inpt.a1.Caption:='1';
 1: usr_inpt.a1.Caption:='2';
end;
end;





////////////////////////////////////тип места//////////////////////////////////////////////////

procedure Ttrips_f.classboxChange(Sender: TObject);
begin
case classbox.ItemIndex of
 0: usr_inpt.c1.Caption:='Первый';
 1: usr_inpt.c1.Caption:='Второй';
 2: usr_inpt.c1.Caption:='Третий';
end;
end;

procedure Ttrips_f.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure Ttrips_f.clsClick(Sender: TObject);
begin
trips_f.Close;
end;


end.
