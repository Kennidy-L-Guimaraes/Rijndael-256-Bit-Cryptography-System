unit unitHash;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, Messages, DCPrijndael, DCPsha256, DCPbase64;

type

  { TSecCipher }

  { THashSHA2 }

  THashSHA2 = Class
    public
      {PUBLIC DECLARATIONS}
      class function GetHashString(const InputText: string):string;
      function EncryptAES(const AText, AKey: string): string;
      //function GenerateRandomIV
    private
      {PRIVATE DECLARATIONS}

  end;

implementation
uses
  unitCipherText;

{ TSecCipher }

class function THashSHA2.GetHashString(const InputText: string):string;
var
Hash      : TDCP_sha256;
  Digest    : array[0..31] of Byte;
  i         : Integer;
  HashString: string;
begin
  Hash := TDCP_sha256.Create(nil);
  try
    Hash.Init;
    Hash.UpdateStr(InputText);
    Hash.Final(Digest);
    HashString := '';
    for i := 0 to 31 do
      HashString := HashString + IntToHex(Digest[i], 2);
    result := HashString;
  finally
    Hash.Free;
  end;
end;

function THashSHA2.EncryptAES(const AText, AKey: string): string;
var
  Cipher: TDCP_rijndael;
  KeyHash: string;
  IV: Array [0..16] of TBytes;
  Data: string;
begin
  Data := UTF8Encode(AText);
  Cipher := TDCP_rijndael.Create(nil);
  try
    KeyHash := (AKey);
    FillChar(IV, SizeOf(IV), 0);
    Cipher.Init(KeyHash[1], 256, @IV);
    Cipher.EncryptCBC(Data[1], Data[1], Length(Data));
    Result := Base64EncodeStr(Data);
  finally
    Cipher.Burn;
    Cipher.Free;
  end;
end;

end.

