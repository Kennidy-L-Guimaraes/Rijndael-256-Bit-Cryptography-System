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
    ExplicitLeft = 200
    ExplicitTop = 120
    ExplicitWidth = 185
    ExplicitHeight = 41
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
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object MemRijndael256Bits: TMemo
      Left = 16
      Top = 307
      Width = 465
      Height = 161
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Button1: TButton
      Left = 16
      Top = 474
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
    end
    object Button2: TButton
      Left = 97
      Top = 474
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
    end
    object Button3: TButton
      Left = 178
      Top = 474
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 4
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
