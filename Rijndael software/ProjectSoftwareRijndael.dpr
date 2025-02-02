program ProjectSoftwareRijndael;

uses
  Vcl.Forms,
  SoftwareInterface in 'SoftwareInterface.pas' {FrmRijndael256};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmRijndael256, FrmRijndael256);
  Application.Run;
end.
