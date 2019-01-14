
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [n mod 10; digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,31)-(6,63)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

*)
