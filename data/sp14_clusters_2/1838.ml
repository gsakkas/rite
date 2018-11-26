
let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) @ (helper (n / 10)) in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec helper x =
    match x with | 0 -> [] | n -> (n mod 10) :: (helper (n / 10)) in
  helper n;;

*)

(* changed spans
(4,45)-(4,46)
(n mod 10) :: (helper (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG LitG]))) Nothing

*)
