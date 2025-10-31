unit unitCipherText;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, unitHash, unitrhcsalt;

type

  { TFrm_CipherText }

  TFrm_CipherText = class(TForm)
    Edt_Salt: TEdit;
    Edt_pass: TEdit;
    Edt_Repass: TEdit;
    Edt_SecretWord: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Mem_Input: TMemo;
    Mem_Output: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Pnl_Hash: TPanel;
    Panel6: TPanel;
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
    Shape1: TShape;
    Shape10: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Edt_SecretWordClick(Sender: TObject);
    procedure Edt_RepassClick(Sender: TObject);
    procedure Edt_passChange(Sender: TObject);
    procedure Edt_passClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Mem_OutputClick(Sender: TObject);
    procedure Mem_InputChange(Sender: TObject);
    procedure Mem_InputClick(Sender: TObject);
    procedure NotResize;
    procedure Hashing;
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Pnl_LoadingCipherClick(Sender: TObject);
    procedure Clear(Sender: TObject);
    procedure Shape7ChangeBounds(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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

procedure TFrm_CipherText.Label8Click(Sender: TObject);
begin

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

procedure TFrm_CipherText.Shape7ChangeBounds(Sender: TObject);
begin

end;

procedure TFrm_CipherText.SpeedButton1Click(Sender: TObject);
var
  Salt: TRHC;
  Sha : THashSHA2;
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
      Edt_Salt.Text := Sha.GetHashString(Edt_SecretWord.Text + Salt.RHCHash + Edt_SecretWord.Text);
    finally
      Salt.Free;
    end;
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

