
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
(6,25)-(6,35)
listReverse
VarG

(6,25)-(6,35)
listReverse [n mod 10]
AppG (fromList [ListG EmptyG Nothing])

(6,39)-(6,50)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
