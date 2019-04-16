
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n >= 10
  then let n = digitsOfInt n
       and f = sumList n in digitalRoot n
  else n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec helper n = let n = digitsOfInt n in sumList n;;

let rec digitalRoot n = if n < 10 then n else helper n;;

*)

(* changed spans
(11,6)-(11,13)
n < 10
BopG VarG LitG

(12,8)-(13,42)
n
VarG

(14,8)-(14,9)
helper n
AppG (fromList [VarG])

*)

(* type error slice
(6,27)-(6,42)
(6,27)-(6,48)
(6,28)-(6,39)
(6,43)-(6,44)
(8,22)-(8,71)
(8,60)-(8,71)
(8,61)-(8,68)
(8,69)-(8,70)
(10,4)-(14,11)
(10,21)-(14,9)
(11,6)-(11,7)
(11,6)-(11,13)
(11,11)-(11,13)
(12,8)-(13,42)
(12,16)-(12,27)
(12,16)-(12,29)
(13,16)-(13,23)
(13,16)-(13,25)
(13,24)-(13,25)
(13,29)-(13,40)
(13,29)-(13,42)
(13,41)-(13,42)
*)
