unit SoftwareInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmRijndael256 = class(TForm)
    PnlBackground: TPanel;
    MemOriginalText: TMemo;
    MemRijndael256Bits: TMemo;
    LblRijndael254bits: TLabel;
    LblOriginalText: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    EdtPassword: TEdit;
    EdtRepeatPassword: TEdit;
    EdtSaltTip: TEdit;
    LblPassword: TLabel;
    LblRepeatPassword: TLabel;
    LblSaltTip: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRijndael256: TFrmRijndael256;

implementation

{$R *.dfm}

end.
