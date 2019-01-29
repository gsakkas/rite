
let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then (listReverse (n mod 10)) :: (digitsOfInt (n / 10)) else [];;


(* fix

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then listReverse ((n mod 10) :: (digitsOfInt (n / 10))) else [];;

*)

(* changed spans
(8,29)-(8,39)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

*)
