program bus_tickets;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  main in 'main.pas' {main_f},
  tables in 'tables.pas' {tabls},
  user_input in 'user_input.pas' {usr_inpt},
  trips in 'trips.pas' {trips_f};

{$R *.res}

begin
  Application.Initialize;
  Application.UseMetropolisUI;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.Title := 'bus_tickets';
  Application.CreateForm(Tmain_f, main_f);
  Application.CreateForm(Ttabls, tabls);
  Application.CreateForm(Tusr_inpt, usr_inpt);
  Application.CreateForm(Ttrips_f, trips_f);
  Application.Run;
end.
