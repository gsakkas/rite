
let rec clone x n =
  let rec helper n = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,51)-(3,65)
x
VarG

(3,51)-(3,65)
clone
VarG

(3,51)-(3,65)
x
VarG

(3,51)-(3,65)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

(3,51)-(3,65)
x :: (clone x (n - 1))
ConAppG (Just (TupleG [VarG,AppG [VarG,BopG VarG LitG]])) Nothing

*)
