unit unitCipherText;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, unitHash, unitrhcsalt,LCLIntf, DCPbase64, Windows;

type

  { TFrm_CipherText }

  TFrm_CipherText = class(TForm)
    Edt_pass: TEdit;
    Edt_Salt: TEdit;
    Edt_Repass: TEdit;
    Edt_SecretWord: TEdit;
    Img_ClosEyes: TImage;
    Img_OpenEyes: TImage;
    Img_MenuTextEncrypt: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Img_PassEyes: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Lbl_MenuKeys: TLabel;
    Lbl_MenuTextEncrypt: TLabel;
    Lbl_MenuGitHub: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Mem_Input: TMemo;
    Mem_Output: TMemo;
    Panel1: TPanel;
    Pnl_BtnEncryption: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Pnl_BtnDecryption: TPanel;
    Panel7: TPanel;
    Pnl_CipherText1: TPanel;
    Pnl_CipherText2: TPanel;
    Pnl_LoadingCipher: TPanel;
    Pnl_MemCipher: TPanel;
    Pnl_CipherText: TPanel;
    Pnl_LeftMenu: TPanel;
    Pnl_MemCipher1: TPanel;
    Pnl_MemCipher2: TPanel;
    Pnl_MemCipher3: TPanel;
    Pnl_MemCipher4: TPanel;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shp_Bar: TShape;
    Shape10: TShape;
    Shape2: TShape;
    Shp_BtnEncryption: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape8: TShape;
    Shp_BtnDecryption: TShape;
    Btn_Encryption: TSpeedButton;
    Btn_Decryption: TSpeedButton;
    procedure Edt_SecretWordClick(Sender: TObject);
    procedure Edt_RepassClick(Sender: TObject);
    procedure Edt_passChange(Sender: TObject);
    procedure Edt_passClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Img_PassEyeClick(Sender: TObject);
    procedure Img_PassEyesClick(Sender: TObject);
    procedure Img_PassEyesDblClick(Sender: TObject);
    procedure Lbl_MenuGitHubClick(Sender: TObject);
    procedure Lbl_MenuGitHubMouseEnter(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Lbl_MenuGitHubMouseLeave(Sender: TObject);
    procedure Lbl_MenuKeysClick(Sender: TObject);
    procedure Lbl_MenuKeysMouseEnter(Sender: TObject);
    procedure Lbl_MenuKeysMouseLeave(Sender: TObject);
    procedure Lbl_MenuTextEncryptMouseEnter(Sender: TObject);
    procedure Lbl_MenuTextEncryptMouseLeave(Sender: TObject);
    procedure Mem_OutputClick(Sender: TObject);
    procedure Mem_InputChange(Sender: TObject);
    procedure Mem_InputClick(Sender: TObject);
    procedure NotResize;
    procedure Hashing;
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Pnl_LoadingCipherClick(Sender: TObject);
    procedure Clear(Sender: TObject);
    procedure Pnl_MemCipher2Click(Sender: TObject);
    procedure Pnl_MemCipher4Click(Sender: TObject);
    procedure Shape7ChangeBounds(Sender: TObject);
    procedure Btn_EncryptionClick(Sender: TObject);
    procedure EncriptText(password: string);
    procedure ProgressBar;
    procedure HoverLabel(ALabel: TLabel; Hover: Boolean);
    procedure generateKeyRandom;
  private

  public

  end;

var
  Frm_CipherText: TFrm_CipherText;

implementation

{$R *.lfm}

{ TFrm_CipherText }

procedure TFrm_CipherText.Image4Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Img_PassEyeClick(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Img_PassEyesClick(Sender: TObject);
begin
  if Img_PassEyes.Tag = 0 then
  begin
    Img_PassEyes.Picture.Assign(Img_OpenEyes.Picture);
    Edt_Pass.PasswordChar := #0;
    Img_PassEyes.Tag := 1;
  end
  else
  begin
    Img_PassEyes.Picture.Assign(Img_ClosEyes.Picture);
    Edt_Pass.PasswordChar := '*';
    Img_PassEyes.Tag := 0;
  end;
end;

procedure TFrm_CipherText.Img_PassEyesDblClick(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Lbl_MenuGitHubClick(Sender: TObject);
begin
   OpenURL('https://meusite.com');
end;

procedure TFrm_CipherText.Lbl_MenuGitHubMouseEnter(Sender: TObject);
begin
    HoverLabel(TLabel(Sender), True);
end;

procedure TFrm_CipherText.Label8Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Lbl_MenuGitHubMouseLeave(Sender: TObject);
begin
    HoverLabel(TLabel(Sender), False);
end;

procedure TFrm_CipherText.Lbl_MenuKeysClick(Sender: TObject);
begin
  generateKeyRandom;
end;

procedure TFrm_CipherText.Lbl_MenuKeysMouseEnter(Sender: TObject);
begin
  HoverLabel(TLabel(Sender), True);
end;

procedure TFrm_CipherText.Lbl_MenuKeysMouseLeave(Sender: TObject);
begin
  HoverLabel(TLabel(Sender), False);
end;

procedure TFrm_CipherText.Lbl_MenuTextEncryptMouseEnter(Sender: TObject);
begin
  HoverLabel(TLabel (Sender), True);
end;

procedure TFrm_CipherText.Lbl_MenuTextEncryptMouseLeave(Sender: TObject);
begin
   HoverLabel(TLabel(Sender), False);
end;

procedure TFrm_CipherText.Mem_OutputClick(Sender: TObject);
begin
  Clear(Mem_Output);
end;

procedure TFrm_CipherText.Mem_InputChange(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Mem_InputClick(Sender: TObject);
begin
    Clear(Mem_Input);
end;

procedure TFrm_CipherText.NotResize;
const
  FIX_HEIGHT = 580;
  FIX_WIDTH  = 626;
begin
  Width  := FIX_WIDTH;
  Height := FIX_HEIGHT;

  Constraints.MinWidth  := FIX_WIDTH;
  Constraints.MaxWidth  := FIX_WIDTH;
  Constraints.MinHeight := FIX_HEIGHT;
  Constraints.MaxHeight := FIX_HEIGHT;

  BorderIcons := BorderIcons - [biMaximize];
  BorderStyle := bsSingle;
end;

procedure TFrm_CipherText.Hashing;
begin

end;

procedure TFrm_CipherText.Panel1Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Panel3Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Pnl_LoadingCipherClick(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Clear(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    (Sender as TEdit).Clear;
    (Sender as TEdit).Font.Color := clWhite;
  end
  else if Sender is TMemo then
  begin
    (Sender as TMemo).Clear;
    (Sender as TMemo).Font.Color := clWhite;
  end;
end;

procedure TFrm_CipherText.Pnl_MemCipher2Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Pnl_MemCipher4Click(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Shape7ChangeBounds(Sender: TObject);
begin

end;

procedure TFrm_CipherText.Btn_EncryptionClick(Sender: TObject);
var
  Salt: TRHC;
  Sha : THashSHA2;
  FinalPass : string;
begin
  if (Edt_SecretWord.Text = 'Enter your word') or (Trim(Edt_SecretWord.Text) = '') then
     begin
          ShowMessage('For security reasons, please provide us with a password or secret text (FOR SALT). ' +
                'This is mandatory so that we can provide the best security.');
     end
     else
     begin
        Salt := TRHC.Create;
        Sha  := THashSHA2.Create;
    try
       Clear(Mem_Output);
       Clear(Edt_Salt);

       ProgressBar;
       FinalPass     := Sha.GetHashString(Edt_SecretWord.Text + Edt_pass.Text + Salt.RHCHash + Edt_pass.Text + Edt_SecretWord.Text);
       Edt_Salt.Text := FinalPass;
       Clear(Edt_SecretWord);
       EncriptText(FinalPass);
    finally
      Salt.Free;
      sha.Free;
    end;
    end;
end;

procedure TFrm_CipherText.EncriptText(password: string);
var
  Encript : THashSHA2;
  EnText    : string;
begin
  Encript := THashSHA2.Create;
  try
  EnText  := Mem_Input.Text;
  Mem_Output.Lines.Add(Encript.EncryptAES(EnText, password));
  finally
  Encript.free;
  end;
end;



procedure TFrm_CipherText.ProgressBar;
var
  I: Integer;
begin
  Shp_Bar.Width := 0;

  for I := 0 to Pnl_LoadingCipher.Width do
  begin
    Shp_Bar.Width := I;
    Application.ProcessMessages; // mantém a UI atualizada
    Sleep(0); // controla a velocidade da animação
  end;
end;

procedure TFrm_CipherText.HoverLabel(ALabel: TLabel; Hover: Boolean);
begin
  if Hover then
  begin
    //Enter
    ALabel.Font.Color := $00F6823B;
    ALabel.Font.Style := [fsUnderline];
    ALabel.Cursor := crHandPoint;
  end
  else
  begin
    //Leave
    ALabel.Font.Color := clWhite;
    ALabel.Font.Style := [];
    ALabel.Cursor := crDefault;
  end;
end;

procedure TFrm_CipherText.generateKeyRandom;
var
  RHC: TRHC;
  Letter, NumRHC, FinalKey: string;
  RandBits: Integer;
begin
  RHC := TRHC.Create;
  try
    //Letters
    Letter := Chr(Ord('A') + Random(26));
    //RHC
    NumRHC := RHC.RHCHashMath;
    NumRHC := StringReplace(NumRHC, '-', '', [rfReplaceAll]);
    NumRHC := StringReplace(NumRHC, ' ', '', [rfReplaceAll]);
    NumRHC := Copy(NumRHC, 1, 6);
    NumRHC := NumRHC + Chr(Ord('A') + Random(26)) + Chr(Ord('A') + Random(26));
    //Random BITs
    RandBits := Random(32768);
    //Concat
    FinalKey := Letter + '-' + NumRHC + '-' + IntToStr(RandBits) + '-' + Chr(Ord('A') + Random(26));
    InputQuery('Random Paswword', 'This password is generated using RHC. It is not saved by the system: ', FinalKey);
  finally
    RHC.Free;
  end;
end;

procedure TFrm_CipherText.FormCreate(Sender: TObject);
begin
  NotResize;
  Hashing;
end;

procedure TFrm_CipherText.Edt_passChange(Sender: TObject);
begin


end;

procedure TFrm_CipherText.Edt_RepassClick(Sender: TObject);
begin
  Clear(Edt_RePass);
end;

procedure TFrm_CipherText.Edt_SecretWordClick(Sender: TObject);
begin
  Clear(Edt_SecretWord);
end;

procedure TFrm_CipherText.Edt_passClick(Sender: TObject);
begin
  Clear(Edt_pass);
end;

end.

