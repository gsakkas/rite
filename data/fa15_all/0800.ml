
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
(12,25)-(12,58)
digitalRoot (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(11,4)-(12,60)
(11,21)-(12,58)
(12,3)-(12,58)
(12,25)-(12,36)
(12,25)-(12,58)
*)
