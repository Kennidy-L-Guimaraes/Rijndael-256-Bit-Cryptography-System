unit unitCipherText;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Pnl_CipherText1: TPanel;
    Pnl_CipherText2: TPanel;
    Pnl_LoadingCipher: TPanel;
    Pnl_MemCipher: TPanel;
    Pnl_CipherText: TPanel;
    Pnl_LeftMenu: TPanel;
    Pnl_MemCipher1: TPanel;
    Shape1: TShape;
    procedure Image4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image4Click(Sender: TObject);
begin

end;

end.

