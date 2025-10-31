unit MersenneTwister;

interface

uses
  SysUtils;

type
  TMersenneTwister = class
  private
    const
      N = 624;
      M = 397;
      MATRIX_A = $9908B0DF;
      UPPER_MASK = $80000000;
      LOWER_MASK = $7FFFFFFF;
    var
      mt: array[0..N - 1] of Cardinal;
      mti: Integer;
    procedure InitGenRand(seed: Cardinal);
    procedure GenerateNumbers;

  public
    constructor Create(seed: Cardinal);
    function Random: Cardinal;
    function RandomFloat: Double;
  end;

implementation

constructor TMersenneTwister.Create(seed: Cardinal);
begin
  InitGenRand(seed);
end;

procedure TMersenneTwister.InitGenRand(seed: Cardinal);
var
  i: Integer;
begin
  mt[0] := seed;
  for i := 1 to N - 1 do
    mt[i] := Cardinal((Int64(1812433253) * (mt[i - 1] xor (mt[i - 1] shr 30)) + i) and $FFFFFFFF);
  mti := N;
end;

procedure TMersenneTwister.GenerateNumbers;
var
  kk: Integer;
  y: Cardinal;
begin
  for kk := 0 to N - M - 1 do
  begin
    y := (mt[kk] and UPPER_MASK) or (mt[kk + 1] and LOWER_MASK);
    mt[kk] := mt[kk + M] xor (y shr 1) xor (-(y and 1) and MATRIX_A);
  end;

  for kk := N - M to N - 2 do
  begin
    y := (mt[kk] and UPPER_MASK) or (mt[kk + 1] and LOWER_MASK);
    mt[kk] := mt[kk + (M - N)] xor (y shr 1) xor (-(y and 1) and MATRIX_A);
  end;

  y := (mt[N - 1] and UPPER_MASK) or (mt[0] and LOWER_MASK);
  mt[N - 1] := mt[M - 1] xor (y shr 1) xor (-(y and 1) and MATRIX_A);
  mti := 0;
end;

function TMersenneTwister.Random: Cardinal;
var
  y: Cardinal;
begin
  if mti >= N then
    GenerateNumbers;

  y := mt[mti];
  Inc(mti);

  // Tempering
  y := y xor (y shr 11);
  y := y xor ((y shl 7) and $9D2C5680);
  y := y xor ((y shl 15) and $EFC60000);
  y := y xor (y shr 18);

  Result := y;
end;

function TMersenneTwister.RandomFloat: Double;
begin
  Result := Random * (1.0 / 4294967296.0); // Div 2^32
end;

end.

