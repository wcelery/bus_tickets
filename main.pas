unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Touch.GestureMgr,
  Vcl.ButtonGroup, Data.DB, Data.Win.ADODB;

type
  Tmain_f = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    Label1: TLabel;
    connection: TADOConnection;
    OpenDialog1: TOpenDialog;
    item1: TImage;
    tables_panel: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    form_panel: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    item2: TImage;
    mdb_panel: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    item3: TImage;
    mnmz: TImage;
    cls: TImage;
    header: TImage;
    bottom: TImage;
    TrayIcon1: TTrayIcon;
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    //procedure FormCreate (Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tables_panelClick(Sender: TObject);
    procedure form_panelClick(Sender: TObject);
    procedure mdb_panelClick(Sender: TObject);
    procedure clsClick(Sender: TObject);
    procedure mnmzClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure OnBalloonClick(Sender: TObject);
    procedure item1Click(Sender: TObject);
    procedure item2Click(Sender: TObject);
    procedure item3Click(Sender: TObject);





  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);

  public
    { Public declarations }
  end;

var
  main_f: Tmain_f;
  i:integer;
implementation

{$R *.dfm}

uses tables, user_input, trips;

const
  AppBarHeight = 75;


procedure Tmain_f.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;


procedure Tmain_f.Button4Click(Sender: TObject);
begin
if OpenDialog1.Execute then
With   connection do
begin
  Connected :=false;//закрываем сущ. соединение
  ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;'+
'Data Source=' +OpenDialog1.FileName+
';Persist Security Info=false'; //формируем новую строку подключения
 Connected :=true;
 end;
  Tabls.clients_adotable.Active:=true;

  Tabls.trip_adotable.Active:=true;

  Tabls.places_adotable.Active:=true;

  Tabls.tickets_adotable.Active:=true;

  Tabls.bus_adotable.Active:=true;


end;

procedure Tmain_f.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure Tmain_f.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;


procedure Tmain_f.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

procedure Tmain_f.CloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tmain_f.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure Tmain_f.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Application.Terminate;
  {if Key = VK_ESCAPE then
    AppBarShow(-1)
  else
    AppBarShow(0);}
end;

procedure Tmain_f.FormResize(Sender: TObject);
begin
  AppBarResize;
end;

procedure Tmain_f.tables_panelClick(Sender: TObject);
begin
tabls.Show;
end;

procedure Tmain_f.form_panelClick(Sender: TObject);
begin
usr_inpt.l1.Visible:=False;
usr_inpt.l2.Visible:=False;
usr_inpt.l3.Visible:=False;
usr_inpt.l4.Visible:=False;
usr_inpt.l5.Visible:=False;
usr_inpt.l6.Visible:=False;
usr_inpt.l7.Visible:=False;
usr_inpt.l8.Visible:=False;
usr_inpt.l9.Visible:=False;
usr_inpt.Show;
end;

procedure Tmain_f.item1Click(Sender: TObject);
begin
tabls.Show;
end;

procedure Tmain_f.item2Click(Sender: TObject);
begin
usr_inpt.l1.Visible:=False;
usr_inpt.l2.Visible:=False;
usr_inpt.l3.Visible:=False;
usr_inpt.l4.Visible:=False;
usr_inpt.l5.Visible:=False;
usr_inpt.l6.Visible:=False;
usr_inpt.l7.Visible:=False;
usr_inpt.l8.Visible:=False;
usr_inpt.l9.Visible:=False;
usr_inpt.Show;
end;

procedure Tmain_f.item3Click(Sender: TObject);
begin
if OpenDialog1.Execute then
With   connection do
begin
  Connected :=false;//закрываем сущ. соединение
  ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;'+
'Data Source=' +OpenDialog1.FileName+
';Persist Security Info=false'; //формируем новую строку подключения
 Connected :=true;
 end;
  Tabls.clients_adotable.Active:=true;

  Tabls.trip_adotable.Active:=true;

  Tabls.places_adotable.Active:=true;

  Tabls.tickets_adotable.Active:=true;

  Tabls.bus_adotable.Active:=true;

  Tabls.DBGrid1.Columns.Grid.Fields[0].DisplayWidth := 5;
Tabls.DBGrid1.Columns.Grid.Fields[1].DisplayWidth := 5;
Tabls.DBGrid2.Columns.Grid.Fields[2].DisplayWidth := 5;
Tabls.DBGrid2.Columns.Grid.Fields[1].DisplayWidth := 5;
Tabls.gr.Columns.Grid.Fields[0].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[1].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[2].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[3].DisplayWidth := 10;
Tabls.DBGrid4.Columns.Grid.Fields[0].DisplayWidth := 5;
Tabls.DBGrid4.Columns.Grid.Fields[1].DisplayWidth := 5;
end;

procedure Tmain_f.mdb_panelClick(Sender: TObject);
begin
if OpenDialog1.Execute then
With   connection do
begin
  Connected :=false;//закрываем сущ. соединение
  ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;'+
'Data Source=' +OpenDialog1.FileName+
';Persist Security Info=false'; //формируем новую строку подключения
 Connected :=true;
 end;
  Tabls.clients_adotable.Active:=true;

  Tabls.trip_adotable.Active:=true;

  Tabls.places_adotable.Active:=true;

  Tabls.tickets_adotable.Active:=true;

  Tabls.bus_adotable.Active:=true;

  Tabls.DBGrid1.Columns.Grid.Fields[0].DisplayWidth := 5;
Tabls.DBGrid1.Columns.Grid.Fields[1].DisplayWidth := 5;
Tabls.DBGrid2.Columns.Grid.Fields[2].DisplayWidth := 5;
Tabls.DBGrid2.Columns.Grid.Fields[1].DisplayWidth := 5;
Tabls.gr.Columns.Grid.Fields[0].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[1].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[2].DisplayWidth := 10;
Tabls.gr.Columns.Grid.Fields[3].DisplayWidth := 10;
Tabls.DBGrid4.Columns.Grid.Fields[0].DisplayWidth := 5;
Tabls.DBGrid4.Columns.Grid.Fields[1].DisplayWidth := 5;


end;

procedure Tmain_f.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure Tmain_f.mnmzClick(Sender: TObject);
begin
AnimateWindow(Handle, 250, aw_blend or aw_hide);
Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.Hint:='Main Form (Click!)';
  TrayIcon1.BalloonTitle:='Main Form';
  TrayIcon1.BalloonHint:='Icon will appear in your tray';
  TrayIcon1.ShowBalloonHint;
end;

procedure Tmain_f.clsClick(Sender: TObject);
begin
AnimateWindow(Handle, 250, aw_blend or aw_hide);
Application.Terminate;
end;

procedure Tmain_f.OnBalloonClick(Sender: TObject);
begin
Show()
end;
end.

//all the shit will be below this string(won't)///////////////////////////////////////////////////////////////////////////////////////

