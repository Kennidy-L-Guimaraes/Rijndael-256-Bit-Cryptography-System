{I didn’t separate it into distinct units
although that would be a good practice
due to the simplicity of the software.
Therefore, it is well-commented and structured within a single unit.
If the project grows, I may make some aesthetic and substantial modifications.
For now, however, the project is simple and straightforward, aimed at text encryption using Rijndael 256-bit.}

unit SoftwareInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DateUtils, Hash;

type
  TFrmRijndael256 = class(TForm)
    PnlBackground: TPanel;
    MemOriginalText: TMemo;
    MemRijndael256Bits: TMemo;
    LblRijndael254bits: TLabel;
    LblOriginalText: TLabel;
    Btn_Encrypt: TButton;
    Btn_Decrypt: TButton;
    Btn_GRS: TButton;
    EdtPassword: TEdit;
    EdtRepeatPassword: TEdit;
    EdtSaltTip: TEdit;
    LblPassword: TLabel;
    LblRepeatPassword: TLabel;
    LblSaltTip: TLabel;
    procedure Btn_EncryptClick(Sender: TObject);
    procedure Btn_GRSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure VerifyPasswords;
    function GenerateRandomSalt:string;
    function EncryptAES(const AText, AKey: string): string;
    function DecryptAES(const AText, AKey: string): string;
  end;

var
  FrmRijndael256: TFrmRijndael256;

implementation

{$R *.dfm}

{ TFrmRijndael256 }

procedure TFrmRijndael256.Btn_EncryptClick(Sender: TObject);
begin
  VerifyPasswords;
end;

procedure TFrmRijndael256.Btn_GRSClick(Sender: TObject);
begin
 EdtSaltTip.Text := GenerateRandomSalt;
end;

function TFrmRijndael256.DecryptAES(const AText, AKey: string): string;
begin

end;

function TFrmRijndael256.EncryptAES(const AText, AKey: string): string;
begin

end;

function TFrmRijndael256.GenerateRandomSalt: string;
const
  Letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
var
  W: string;
  X, Y, Z: Integer;
  C1, C2, C3: Char;
begin
  Randomize;

  //Numbers based in TIME
  X := Random(1000) + MilliSecondOf(Now);
  Y := Random(100);
  Z := Random(500) + 1;

  //Random letter
  C1 := Letters[Random(Length(Letters)) + 1];
  C2 := Letters[Random(Length(Letters)) + 1];
  C3 := Letters[Random(Length(Letters)) + 1];

  //Concat
  W := C1 + IntToStr(X) + C2 + IntToStr(Y) + C3 + IntToStr(Z);

  Result := THashSHA2.GetHashString(w);
end;

procedure TFrmRijndael256.VerifyPasswords;
var
x, y : string;
begin
x := EdtPassword.Text;
y := EdtRepeatPassword.Text;

if X <> y then
  Begin
  ShowMessage('The passwords are different!')
  End
  else

end;

end.
