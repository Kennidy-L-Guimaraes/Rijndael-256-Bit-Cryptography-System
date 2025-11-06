program CipherText;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitCipherText, unitrhcsalt, unitHash, unitFrmRandomPass
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFrm_CipherText, Frm_CipherText);
  Application.CreateForm(TFrm_RandomPassword, Frm_RandomPassword);
  Application.Run;
end.

