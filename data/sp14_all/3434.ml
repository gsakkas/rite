
let rec sumList xs =
  if (List.length xs) != 0 then (xs.(0)) + (sumList (List.hd xs));;


(* fix

let rec sumList xs = let x::t = xs in x + (sumList t);;

*)

(* changed spans
(3,3)-(3,66)
let x :: t = xs in
x + sumList t
LetG NonRec (fromList [(ConsPatG VarPatG VarPatG,VarG)]) (BopG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,66)
(3,6)-(3,22)
(3,7)-(3,18)
(3,19)-(3,21)
(3,33)-(3,41)
(3,33)-(3,66)
(3,34)-(3,36)
(3,34)-(3,40)
(3,66)-(3,66)
*)
