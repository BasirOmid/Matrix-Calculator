program Matrix_calculator_u;

uses
  System.StartUpCopy,
  FMX.Forms,
  Matrix_calculator_p in 'Matrix_calculator_p.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
