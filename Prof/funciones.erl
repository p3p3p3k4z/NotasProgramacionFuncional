-module(funciones).
-export([fact/1]).

fact(0) -> 1;
fact(N) when (N>1) -> N*fact(N-1).
