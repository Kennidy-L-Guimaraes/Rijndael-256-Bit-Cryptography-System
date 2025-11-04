{
 /$$$$$$$  /$$   /$$  /$$$$$$
| $$__  $$| $$  | $$ /$$__  $$
| $$  \ $$| $$  | $$| $$  \__/
| $$$$$$$/| $$$$$$$$| $$
| $$__  $$| $$__  $$| $$
| $$  \ $$| $$  | $$| $$    $$
| $$  | $$| $$  | $$|  $$$$$$/
|__/  |__/|__/  |__/ \______/

Experimental Random Hash Cascade Implementation.
Read the study article if you have any questions.
Remember that you can make any changes to this code.

MIT License

Copyright (c) [2024] [Kennidy L. Guimarães]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "RHC Test.exe or TRHC.Unit"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

**In addition, any use, modification, or redistribution of this software must
include an explicit acknowledgment to the original author, [Kennidy L. Guimarães].**
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
}

{This class depends on:
MersenneTwister.pas}
unit unitrhcsalt;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, DateUtils, unitHash, MersenneTwister, windows;

type

  { TRHC }

  TRHC = class
  private
    // internal state
    FMT: TMersenneTwister;
    FA, FB, FC, FD, FE: Cardinal;
    FSeedTime: Cardinal;
    function GetTimeNowMillis: Cardinal;
    function NumRam: Cardinal;
    function RhcMersenneTwister(Seed: Cardinal): string;
  public
    constructor Create(OptionalSeed: Cardinal = 0);
    destructor Destroy; override;

    // Main public hash method
    function RHCHash: string;

    // Internal math/entropy injector (keeps state)
    function RHCHashMath: string;
  end;

implementation

{ TRHC }

constructor TRHC.Create(OptionalSeed: Cardinal);
var
  seed: Cardinal;
begin
  inherited Create;
  // Determine initial seed (if 0, derive from time)
  if OptionalSeed = 0 then
  begin
    // use milliseconds of day plus low 32 bits of TickCount64 if available
    seed := GetTickCount64 and $FFFFFFFF;
    seed := seed xor GetTimeNowMillis;
  end
  else
    seed := OptionalSeed;

  // Create a Mersenne Twister instance once for this object
  FMT := TMersenneTwister.Create(seed);

  // initialize some internal state values
  FA := NumRam;
  FB := NumRam;
  FC := NumRam;
  FD := NumRam;
  FE := NumRam;

  // initial SeedTime
  FSeedTime := GetTimeNowMillis xor FA;
end;

destructor TRHC.Destroy;
begin
  FreeAndNil(FMT);
  inherited Destroy;
end;

// Return milliseconds elapsed since midnight (0..86_399_999)
function TRHC.GetTimeNowMillis: Cardinal;
var
  Hour, Min, Sec, MS: Word;
begin
  DecodeTime(Now, Hour, Min, Sec, MS);
  Result := Cardinal(((Hour * 60 + Min) * 60 + Sec) * 1000 + MS);
end;

// Produce a pseudo-random integer using the instance MersenneTwister (1..100000)
function TRHC.NumRam: Cardinal;
var
  r: Double;
  val: Cardinal;
begin
  // Use the instance PRNG rather than global Random()
  // Assume FMT.Random returns a double in [0,1)
  r := FMT.Random;
  val := Cardinal(Trunc(r * 100000.0)) + 1;
  if val = 0 then
    val := 1;
  Result := val;
end;

// Return a string derived from a Mersenne Twister seeded by 'Seed'.
// Uses the MT API .Random (returns double) to generate an integer string.
function TRHC.RhcMersenneTwister(Seed: Cardinal): string;
var
  MTlocal: TMersenneTwister;
  r: Double;
  v: Int64;
begin
  // Create a short-lived MT seeded with 'Seed' to derive a value
  MTlocal := TMersenneTwister.Create(Seed);
  try
    r := MTlocal.Random; // expected in [0,1)
    v := Trunc(r * 2147483647); // scale to 31-bit int
    Result := IntToStr(v);
  finally
    MTlocal.Free;
  end;
end;

// Internal mixing function that updates state and returns a pseudo-random string
function TRHC.RHCHashMath: string;
var
  ModA: Cardinal;
  partial: Int64;
  tmpA, tmpB, tmpC, tmpD, tmpE: Cardinal;
begin
  // Take some fresh entropy from the instance MT
  tmpA := NumRam;
  tmpB := NumRam;
  tmpC := NumRam;
  tmpD := NumRam;
  tmpE := NumRam;

  // update stored state with xor/mix (keeps it evolving)
  FA := FA xor tmpA;
  FB := FB + tmpB;
  FC := FC xor (tmpC shl 3);
  FD := FD + (tmpD shr 2);
  FE := FE xor (tmpE * 1664525); // simple LCG mix

  // Build a modulus to avoid trivial small values
  ModA := NumRam;
  if ModA < 100 then
    ModA := ModA + 100;

  // Mix SeedTime with the current state in a reversible-ish manner
  partial := Int64(FSeedTime);
  partial := partial xor (Int64(FA) shl 5);
  partial := partial + (Int64(FB) * Int64(FC));
  partial := partial xor (Int64(FD) + Int64(FE));
  // avalanche step
  partial := partial xor (partial shr 16) xor (partial shl 7);

  if ModA > 0 then
    partial := partial mod ModA;

  // update seed time for next round
  FSeedTime := Cardinal(partial and $FFFFFFFF);

  // Derive a string from a MT seeded by the mixed seed
  Result := RhcMersenneTwister(FSeedTime);
end;

// Main hash function: constructs blocks of strings, hashes in rounds
function TRHC.RHCHash: string;
var
  v01, v02, v03, v04, v05, v06, v07, v08: array of string;
  i: Integer;
  BlockArray: string;
  Bk1, Bk2, Bk3, Bk4: string;
begin
  // Prepare arrays with 9 items each (0..8)
  SetLength(v01, 9); SetLength(v02, 9); SetLength(v03, 9);
  SetLength(v04, 9); SetLength(v05, 9); SetLength(v06, 9);
  SetLength(v07, 9); SetLength(v08, 9);

  // Fill arrays; each call should evolve internal state
  for i := 0 to 8 do
  begin
    v01[i] := RHCHashMath;
    v02[i] := RHCHashMath;
    v03[i] := RHCHashMath;
    v04[i] := RHCHashMath;
    v05[i] := RHCHashMath;
    v06[i] := RHCHashMath;
    v07[i] := RHCHashMath;
    v08[i] := RHCHashMath;
  end;

  // Build a single block string concatenating the i-th elements of each vector
  BlockArray := '';
  for i := 0 to 8 do
  begin
    BlockArray := BlockArray + v01[i] + ' ';
    BlockArray := BlockArray + v02[i] + ' ';
    BlockArray := BlockArray + v03[i] + ' ';
    BlockArray := BlockArray + v04[i] + ' ';
    BlockArray := BlockArray + v05[i] + ' ';
    BlockArray := BlockArray + v06[i] + ' ';
    BlockArray := BlockArray + v07[i] + ' ';
    BlockArray := BlockArray + v08[i] + ' ';
  end;

  // Final cascade of SHA-2 hashing (using unitHash / THashSHA2)
  // Bk1 depends on block + a final entropy pull
  Bk1 := THashSHA2.GetHashString(BlockArray + IntToStr(NumRam));
  Bk2 := THashSHA2.GetHashString(BlockArray + Bk1);
  Bk3 := THashSHA2.GetHashString(BlockArray + Bk1 + Bk2);

  // Mix the intermediate hexes and hash again
  Bk4 := THashSHA2.GetHashString(
    THashSHA2.GetHashString(Bk1) +
    THashSHA2.GetHashString(Bk2) +
    THashSHA2.GetHashString(Bk3)
  );

  Result := Bk4;
end;

end.
