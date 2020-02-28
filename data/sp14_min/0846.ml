
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList digitsOfInt n;;


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
(11,25)-(11,46)
sumList (digitsOfInt n)
AppG [AppG [EmptyG]]

*)

(* type error slice
(9,35)-(9,72)
(9,50)-(9,72)
(9,51)-(9,58)
(11,25)-(11,32)
(11,25)-(11,46)
*)
