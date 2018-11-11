
let rec clone x n =
  let rec helper = match n with | 0 -> [] | _ -> x :: ((helper n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,54)-(3,70)
clone
VarG

(3,54)-(3,70)
x
VarG

(3,54)-(3,70)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
