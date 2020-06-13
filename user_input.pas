unit user_input;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Mask,System.UITypes, Math, Vcl.WinXPickers, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, DATEUTILS;

type
  Tusr_inpt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    main_query: TADOQuery;
    dep: TADOQuery;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    l9: TLabel;
    places: TADOQuery;
    p1: TLabel;
    p2: TLabel;
    p3: TLabel;
    p4: TLabel;
    p5: TLabel;
    p6: TLabel;
    p7: TLabel;
    p8: TLabel;
    p9: TLabel;
    Button3: TButton;
    a1: TLabel;
    c1: TLabel;
    DatePicker1: TDatePicker;
    header: TImage;
    Label8: TLabel;
    Button2: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DatePicker2: TDatePicker;
    Label12: TLabel;
    mnmz: TImage;
    cls: TImage;
    bottom: TImage;
    tickets: TADOQuery;
    TrayIcon1: TTrayIcon;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure clsClick(Sender: TObject);
    procedure mnmzClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TrayIcon1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  remain1, remain2, remain3, remain4, remain5, remain6, remain7, remain8, remain9,
  o1, o2, o3, o4, o5, o6, o7, o8, o9,
  u1_id, u2_id, u3_id, u4_id, u5_id, u6_id, u7_id, u8_id, u9_id :  Integer;
  usr_inpt: Tusr_inpt;
  m: TDate;

implementation

{$R *.dfm}

uses tables, main, trips;


procedure Tusr_inpt.clsClick(Sender: TObject);
begin
usr_inpt.Close;
end;

procedure Tusr_inpt.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
  setting its state property to wsNormal. }
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure Tusr_inpt.mnmzClick(Sender: TObject);
begin
AnimateWindow(Handle, 250, aw_blend or aw_hide);
Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.Hint:='User Input (Click!)';
  TrayIcon1.BalloonTitle:='User Input';
  TrayIcon1.BalloonHint:='Icon will appear in your tray';
  TrayIcon1.ShowBalloonHint;
end;

procedure Tusr_inpt.FormShow(Sender: TObject);
begin
  AnimateWindow(Handle, 250, AW_BLEND or AW_SLIDE);
end;

procedure Tusr_inpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AnimateWindow(Handle, 250, aw_blend or aw_hide);
end;

procedure Tusr_inpt.FormCreate(Sender: TObject);
begin
DatePicker1.Date:=Now;
DatePicker2.Date:=Now;
BorderStyle:=bsNone;
DatePicker2.Visible:=False;
remain1:=20;
remain2:=20;
remain3:=20;
remain4:=20;
remain5:=20;
remain6:=20;
remain7:=20;
remain8:=20;
remain9:=20;
end;

procedure Tusr_inpt.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;

 procedure Tusr_inpt.Button1Click(Sender: TObject);
 var i1, i2, i3, i4, i5, i6, i7, i8, i9:integer;

 begin
  try
  if trips_f.r1.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o1:=o1+1;

    Dec(remain1);

    randomize;
    for i1 := 1 to 5 do
     begin
     u1_id:=Random(1000);
     end;

    if o1>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u1_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p1.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u1_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Иркутск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('rmn').Value:=remain1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Братск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('rmn').Value:=remain1-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p1.Caption);
      Parameters.ParamByName('uid').Value:=u1_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p1.Caption);
      Parameters.ParamByName('uid').Value:=u1_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Иркутск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l1.Caption);
      Parameters.ParamByName('rmn').Value:=remain1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r2.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o2:=o2+1;

    Dec(remain2);

    randomize;
    for i2 := 1 to 5 do
     begin
     u2_id:=Random(1000);
     end;

    if o2>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u2_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p2.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u2_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('rmn').Value:=remain1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Братск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('rmn').Value:=remain2-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p2.Caption);
      Parameters.ParamByName('uid').Value:=u2_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p2.Caption);
      Parameters.ParamByName('uid').Value:=u2_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l2.Caption);
      Parameters.ParamByName('rmn').Value:=remain2;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r3.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o3:=o3+1;

    Dec(remain3);

    randomize;
    for i3 := 1 to 5 do
     begin
     u3_id:=Random(1000);
     end;

    if o3>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u3_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p3.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u3_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('rmn').Value:=remain3;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Новосибирск'', ''Братск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('rmn').Value:=remain3-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p3.Caption);
      Parameters.ParamByName('uid').Value:=u3_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p3.Caption);
      Parameters.ParamByName('uid').Value:=u3_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Братск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l3.Caption);
      Parameters.ParamByName('rmn').Value:=remain3;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r4.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o4:=o4+1;

    Dec(remain4);

    randomize;
    for i4 := 1 to 5 do
     begin
     u4_id:=Random(1000);
     end;

    if o4>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u4_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p4.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u4_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('rmn').Value:=remain4;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Иркутск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('rmn').Value:=remain4-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p4.Caption);
      Parameters.ParamByName('uid').Value:=u4_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p4.Caption);
      Parameters.ParamByName('uid').Value:=u4_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l4.Caption);
      Parameters.ParamByName('rmn').Value:=remain4;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r5.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o5:=o5+1;

    Dec(remain5);

    randomize;
    for i5 := 1 to 5 do
     begin
     u5_id:=Random(1000);
     end;

    if o5>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u5_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p5.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u5_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('rmn').Value:=remain5;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Новосибирск'', ''Иркутск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('rmn').Value:=remain5-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p5.Caption);
      Parameters.ParamByName('uid').Value:=u5_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p5.Caption);
      Parameters.ParamByName('uid').Value:=u5_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l5.Caption);
      Parameters.ParamByName('rmn').Value:=remain5;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r6.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o6:=o6+1;

    Dec(remain6);

    randomize;
    for i6 := 1 to 5 do
     begin
     u6_id:=Random(1000);
     end;

    if o6>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u6_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

     with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p6.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u6_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('rmn').Value:=remain6;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Москва'', ''Иркутск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('rmn').Value:=remain6-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p6.Caption);
      Parameters.ParamByName('uid').Value:=u6_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p6.Caption);
      Parameters.ParamByName('uid').Value:=u6_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Иркутск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l6.Caption);
      Parameters.ParamByName('rmn').Value:=remain6;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r7.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o7:=o7+1;

    Dec(remain7);

    randomize;
    for i7 := 1 to 5 do
     begin
     u7_id:=Random(1000);
     end;

    if o7>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u7_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

     with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p7.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u7_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('rmn').Value:=remain7;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Москва'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('rmn').Value:=remain7-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p7.Caption);
      Parameters.ParamByName('uid').Value:=u7_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p7.Caption);
      Parameters.ParamByName('uid').Value:=u7_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l7.Caption);
      Parameters.ParamByName('rmn').Value:=remain7;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r8.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o8:=o8+1;

    Dec(remain8);

    randomize;
    for i8 := 1 to 5 do
     begin
     u8_id:=Random(1000);
     end;

    if o8>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u8_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p8.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u8_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('rmn').Value:=remain8;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Новосибирск'', ''Красноярск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('rmn').Value:=remain8-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p8.Caption);
      Parameters.ParamByName('uid').Value:=u8_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p8.Caption);
      Parameters.ParamByName('uid').Value:=u8_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Красноярск'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l8.Caption);
      Parameters.ParamByName('rmn').Value:=remain8;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;

  if trips_f.r9.Checked=True then

    begin
    ////////////////////////////////учет мест////////////////////////////////////////////////////////////////////
    o9:=o9+1;

    Dec(remain9);

    randomize;
    for i9 := 1 to 5 do
     begin
     u9_id:=Random(1000);
     end;

    if o9>20 then ///////////////////количество мест///////////////////////////////////
     begin
      MessageDlg('Error', mtError, [mbOk], 0);
      Button1.Enabled:=False;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Exit;
     end;
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    with main_query do
     begin
      SQL.Add('INSERT INTO [Клиенты] ([id_рейса],[Фамилия], [Имя], [Отчество], [id_клиента], [Дата_заказа]) VALUES (:rnd, :fam, :name, :sub_name, :uid, :order)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('fam').Value:=Edit1.Text;
      Parameters.ParamByName('name').Value:=Edit2.Text;
      Parameters.ParamByName('sub_name').Value:=Edit3.Text;
      Parameters.ParamByName('uid').Value:=u9_id;
      Parameters.ParamByName('order').Value:=FormatDateTime('dd.mm.yyyy', Now);
      ExecSQL; //Выполняем запрос и открываем набор данных
      Close;
      SQL.Clear;
     end;

    with places do
     begin
      SQL.Add('INSERT INTO [Места] ([Номер_места],[id_рейса],[id_автобуса],[Класс_места], [id_клиента]) VALUES (:plc, :rnd, :bus, :class, :uid)');
      Parameters.ParamByName('plc').Value:=StrToInt(p9.Caption);
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('class').Value:=c1.Caption;
      Parameters.ParamByName('uid').Value:=u9_id;
      ExecSQL;
      Close;
      SQL.Clear;
     end;

    if Checkbox1.Checked=True then   ///////////////////////////////////////////////////////////////////////в оба конца
     begin
      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Новосибирск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('rmn').Value:=remain9;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Москва'', ''Новосибирск'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('rmn').Value:=remain9-1;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker2.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker2.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p9.Caption);
      Parameters.ParamByName('uid').Value:=u9_id;
      Parameters.ParamByName('bln').Value:=True;
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    if Checkbox1.Checked=False then   ///////////////////////////////////////////////////////////////////////в один конец
     begin
     with tickets do
      begin
      SQL.Add('INSERT INTO [Билеты] ([id_рейса],[Номер_места],[id_клиента],[Обе_стороны]) VALUES (:rnd, :plc, :uid, :bln)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('plc').Value:=StrToInt(p9.Caption);
      Parameters.ParamByName('uid').Value:=u9_id;
      Parameters.ParamByName('bln').Value:=False;
      ExecSQL;
      Close;
      SQL.Clear;
      end;

      with dep do
      begin
      SQL.Add('INSERT INTO [Рейсы] ([Место_отправления],[Место_прибытия],[id_рейса],[Свободных_мест],[id_автобуса], [Дата_отправления], [Дата_прибытия]) VALUES (''Новосибирск'', ''Москва'', :rnd, :rmn, :bus, :date_dep, :date_arr)');
      Parameters.ParamByName('rnd').Value:=StrToInt(l9.Caption);
      Parameters.ParamByName('rmn').Value:=remain9;
      Parameters.ParamByName('bus').Value:=StrToInt(a1.Caption);
      Parameters.ParamByName('date_dep').Value:=DateToStr(DatePicker1.Date);
      Parameters.ParamByName('date_arr').Value:=DateToStr(IncDay(DatePicker1.Date, 2));
      ExecSQL;
      Close;
      SQL.Clear;
      end;
     end;

    end;


 Edit1.Clear;
 Edit2.Clear;
 Edit3.Clear;
 finally
  ShowMessage('Success!')
  end;
 end;

procedure Tusr_inpt.Button2Click(Sender: TObject);
begin
if trips_f.r1.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 2);            // + 2 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r2.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 4);            // + 4 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r3.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 6);            // + 6 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r4.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 3);            // + 3 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r5.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 5);            // + 5 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r6.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 10);            // + 10 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r7.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 8);            // + 8 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r8.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 2);            // + 2 дней
  Label9.Caption:= DateToStr(m);
  end;

if trips_f.r9.Checked=True then
  begin
  m:= IncDay(DatePicker1.Date, 6);            // + 6 дней
  Label9.Caption:= DateToStr(m);
  end;
end;

procedure Tusr_inpt.Button3Click(Sender: TObject);
begin
trips_f.Show;
end;

procedure Tusr_inpt.CheckBox1Click(Sender: TObject);
begin
DatePicker2.Visible:=True;
Label12.Visible:=True;
if CheckBox1.Checked=False then
begin
DatePicker2.Visible:=False;
Label12.Visible:=False;
end;
DatePicker2.Hint:='Дата отъезда из пункта назначения';
DatePicker2.ShowHint:=true;
end;


end.
