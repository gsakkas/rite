
let rec sumList xs =
  if (List.length xs) != 0 then (xs.(0)) + (sumList (List.hd xs));;


(* fix

let rec sumList xs = let x::t = xs in x + (sumList t);;

*)

(* changed spans
(3,2)-(3,65)
t
VarG

(3,6)-(3,17)
let x :: t = xs in
x + sumList t
LetG NonRec [VarG] (BopG EmptyG EmptyG)

(3,37)-(3,38)
x
VarG

*)
