
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> (helper n) - 1 in helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,49)-(3,63)
x
VarG

(3,49)-(3,63)
clone
VarG

(3,49)-(3,63)
x
VarG

(3,49)-(3,63)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(3,49)-(3,63)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

*)
