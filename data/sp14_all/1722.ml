
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (listReverse digitsOfInt (n / 10));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (listReverse [n mod 10]) @ (digitsOfInt (n / 10));;

*)

(* changed spans
(6,26)-(6,36)
listReverse [n mod 10]
AppG (fromList [ListG (fromList [EmptyG])])

(6,39)-(6,73)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,37)-(3,52)
(3,37)-(3,58)
(3,38)-(3,49)
(3,53)-(3,54)
(6,39)-(6,73)
(6,40)-(6,51)
*)
