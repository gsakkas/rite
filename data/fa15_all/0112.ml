
let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) digitsOfInt 0 else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans
(3,36)-(3,60)
(n mod 10) :: return
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

*)
