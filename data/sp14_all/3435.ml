
let rec sumList xs =
  if (List.length xs) != 0 then (List.nth xs 0) + (sumList (List.hd xs));;


(* fix

let rec sumList xs = let x::t = xs in x + (sumList t);;

*)

(* changed spans
(3,3)-(3,73)
let x :: t = xs in
x + sumList t
LetG NonRec (fromList [(ConsPatG VarPatG VarPatG,VarG)]) (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,73)
(3,33)-(3,73)
(3,73)-(3,73)
*)
