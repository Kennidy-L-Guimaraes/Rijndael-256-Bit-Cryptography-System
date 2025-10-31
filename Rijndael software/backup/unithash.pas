unit unitHash;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, Messages, DCPrijndael, DCPsha256;

type

  { TSecCipher }

  THashSHA2 = Class
    public
      {PUBLIC DECLARATIONS}
      function GetHashString(const InputText: string):string;
    private
      {PRIVATE DECLARATIONS}

  end;

implementation
uses
  unitCipherText;

{ TSecCipher }

function THashSHA2.GetHashString(const InputText: string):string;
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

end.

