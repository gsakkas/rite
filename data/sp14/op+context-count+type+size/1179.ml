
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitalRoot n = if n < 10 then n else digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(8,20)-(8,59)
(8,24)-(8,59)
(8,27)-(8,28)
(8,27)-(8,33)
(8,31)-(8,33)
(8,39)-(8,40)
(8,46)-(8,57)
(8,46)-(8,59)
(8,58)-(8,59)
*)

(* type error slice
(6,31)-(6,67)
(6,45)-(6,67)
(6,46)-(6,57)
(8,24)-(8,59)
(8,24)-(8,59)
(8,27)-(8,28)
(8,27)-(8,33)
(8,27)-(8,33)
(8,31)-(8,33)
(8,39)-(8,40)
(8,46)-(8,57)
(8,46)-(8,59)
*)
