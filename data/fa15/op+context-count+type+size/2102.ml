
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
(11,2)-(14,8)
(11,5)-(11,6)
(11,5)-(11,12)
(11,10)-(11,12)
(12,7)-(13,41)
(13,28)-(13,39)
(13,28)-(13,41)
(13,40)-(13,41)
(14,7)-(14,8)
*)

(* type error slice
(6,26)-(6,41)
(6,26)-(6,47)
(6,27)-(6,38)
(6,42)-(6,43)
(8,21)-(8,70)
(8,21)-(8,70)
(8,59)-(8,70)
(8,60)-(8,67)
(8,68)-(8,69)
(10,3)-(14,10)
(10,20)-(14,8)
(11,5)-(11,6)
(11,5)-(11,12)
(11,5)-(11,12)
(11,10)-(11,12)
(12,7)-(13,41)
(12,15)-(12,26)
(12,15)-(12,28)
(13,15)-(13,22)
(13,15)-(13,24)
(13,23)-(13,24)
(13,28)-(13,39)
(13,28)-(13,41)
(13,40)-(13,41)
*)
