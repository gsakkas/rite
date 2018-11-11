
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else n - ((n / 10) * (10 append digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,25)-(6,74)
(n - ((n / 10) * 10)) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG [BopG VarG (BopG (BopG VarG LitG) LitG),AppG [BopG VarG LitG]])) Nothing

(6,45)-(6,51)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
