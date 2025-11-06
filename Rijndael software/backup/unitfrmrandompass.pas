unit unitFrmRandomPass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons;

type

  { TFrm_RandomPassword }

  TFrm_RandomPassword = class(TForm)
    Btn_Encryption: TSpeedButton;
    Label10: TLabel;
    Mem_Keys: TMemo;
    Pnl_Background: TPanel;
    Pnl_BtnEncryption: TPanel;
    Shape8: TShape;
    Shp_BtnEncryption: TShape;
    procedure Btn_EncryptionClick(Sender: TObject);
  private

  public

  end;

var
  Frm_RandomPassword: TFrm_RandomPassword;

implementation

{$R *.lfm}

{ TFrm_RandomPassword }

procedure TFrm_RandomPassword.Btn_EncryptionClick(Sender: TObject);
begin
  Close;
end;

end.

