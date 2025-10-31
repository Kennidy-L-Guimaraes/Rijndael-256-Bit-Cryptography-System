unit UnitCipherSalt;

{$mode ObjFPC}{$H+}

interface
{Algoritmo
Obter Timestamp ← FormatDateTime('yyyymmddhhnnsszzz', Now)
Obter MachineID ← identificador da máquina (ex.: GetEnvironmentVariable('COMPUTERNAME'))
Inicializar gerador seguro (se disponível): CSPRNG — se não, Randomize uma vez
Gerar Rand1 ← número aleatório entre 0 e HourOf(Now)
Gerar Rand2 ← número aleatório entre 0 e 99999
Calcular Num := Rand1 + Rand2
Selecionar AsciiChars ← 1 ou mais caracteres aleatórios do array ASCII (ASCII_PRINTABLE[ Random(...) ])
Montar Input := Timestamp + MachineID + IntToStr(Num) + AsciiChars
Calcular Hash1 := SHA256(Input)
Montar Input2 := Hash1 + SecretPhrase + Hash1 (se houver SecretPhrase)
Calcular HashFinal := SHA256(Input2)
Retornar/usar HashFinal (codificar em hex/base64 se desejar)}

uses
  Classes, SysUtils, DateUtils;

type
  { TRandomSec }

  TRandomSec = class
  public
    { PUBLIC DECLARATIONS }
    function GetTimestamp: string;
    procedure RandsRandomize;

  private
    { PRIVATE DECLARATIONS }

  const
    ASCII_PRINTABLE: array[0..94] of Char = (
      ' ', '!', '"', '#', '$', '%', '&', '''', '(', ')', '*', '+', ',', '-', '.', '/',
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      ':', ';', '<', '=', '>', '?', '@',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
      'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      '[', '\', ']', '^', '_', '`',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
      'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      '{', '|', '}', '~'
    );

  end;

implementation

{ TRandomSec }

function TRandomSec.GetTimestamp: string;
begin
  Result := FormatDateTime('yyyymmddhhnnss', Now) +
  Format('%.3d', [MillisecondsBetween(Now, 0) mod 1000]);
end;

procedure TRandomSec.RandsRandomize;
  var
    Rand1 : Double;
    Rand2 : Double;
    Sum   : Double;
    ASCII : Char;
    HourNow: Integer;
  begin
    Randomize;
    HourNow := HourOf(Now);
    Rand1 := Random * HourNow;
    Rand2 := Random * 99999;

    Sum := Rand1 + Rand2;
    ASCII := ASCII_PRINTABLE[Random(Length(ASCII_PRINTABLE))];

end;

end.


{ TRandomSec }



end.

