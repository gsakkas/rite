
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse digitsOfInt (n / 10));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse (digitsOfInt (n / 10)));;

*)

(* changed spans
(6,40)-(6,74)
listReverse (digitsOfInt (n / 10))
AppG [AppG [EmptyG]]

*)

(* type error slice
(3,37)-(3,52)
(3,37)-(3,58)
(3,38)-(3,49)
(3,53)-(3,54)
(6,40)-(6,74)
(6,41)-(6,52)
*)
