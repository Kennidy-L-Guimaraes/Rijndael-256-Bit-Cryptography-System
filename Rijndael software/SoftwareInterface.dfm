object FrmRijndael256: TFrmRijndael256
  Left = 0
  Top = 0
  Caption = 'Rijndael 256-Bits Cryptography System'
  ClientHeight = 509
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object PnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 509
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LblRijndael254bits: TLabel
      Left = 16
      Top = 286
      Width = 112
      Height = 15
      Caption = 'Text Rijndael 256 Bits:'
    end
    object LblOriginalText: TLabel
      Left = 16
      Top = 83
      Width = 69
      Height = 15
      Caption = 'Original Text:'
    end
    object LblPassword: TLabel
      Left = 16
      Top = 25
      Width = 50
      Height = 15
      Caption = 'Password'
    end
    object LblRepeatPassword: TLabel
      Left = 143
      Top = 25
      Width = 89
      Height = 15
      Caption = 'Repeat password'
    end
    object LblSaltTip: TLabel
      Left = 270
      Top = 25
      Width = 50
      Height = 15
      Caption = 'Salt or tip'
    end
    object MemOriginalText: TMemo
      Left = 16
      Top = 104
      Width = 465
      Height = 161
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object MemRijndael256Bits: TMemo
      Left = 16
      Top = 307
      Width = 465
      Height = 161
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Btn_Encrypt: TButton
      Left = 16
      Top = 474
      Width = 75
      Height = 25
      Caption = 'Encrypt'
      TabOrder = 2
      OnClick = Btn_EncryptClick
    end
    object Btn_Decrypt: TButton
      Left = 97
      Top = 474
      Width = 75
      Height = 25
      Caption = 'Decrypt'
      TabOrder = 3
    end
    object Btn_GRS: TButton
      Left = 178
      Top = 474
      Width = 135
      Height = 25
      Caption = 'Generate Random Salt'
      TabOrder = 4
      OnClick = Btn_GRSClick
    end
    object EdtPassword: TEdit
      Left = 16
      Top = 46
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 5
    end
    object EdtRepeatPassword: TEdit
      Left = 143
      Top = 46
      Width = 121
      Height = 23
      PasswordChar = '*'
      TabOrder = 6
    end
    object EdtSaltTip: TEdit
      Left = 270
      Top = 46
      Width = 121
      Height = 23
      TabOrder = 7
    end
  end
end
