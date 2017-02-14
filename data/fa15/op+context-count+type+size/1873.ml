
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(12,24)-(12,57)
(12,36)-(12,43)
(12,44)-(12,55)
*)

(* type error slice
(11,3)-(12,59)
(11,20)-(12,57)
(12,2)-(12,57)
(12,24)-(12,35)
(12,24)-(12,57)
*)
