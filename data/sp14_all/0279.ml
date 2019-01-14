
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
(6,39)-(6,73)
listReverse (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG])])

(6,52)-(6,63)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
