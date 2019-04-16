
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else digitsOfInt (n / 10) add [n mod 10];;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,54)-(3,75)
front :: (add back next)
ConAppG (Just (TupleG (fromList [EmptyG])))

(6,26)-(6,61)
add (digitsOfInt (n / 10))
    (n mod 10)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(5,4)-(6,63)
(5,21)-(6,61)
(6,3)-(6,61)
(6,26)-(6,37)
(6,26)-(6,61)
*)
