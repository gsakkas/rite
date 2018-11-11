
let rec sumList xs =
  if (List.length xs) != 0 then (List.nth xs 0) + (sumList (List.tl xs));;


(* fix

let rec sumList xs = let x::t = xs in x + (sumList t);;

*)

(* changed spans
(3,2)-(3,72)
t
VarG

(3,6)-(3,17)
let x :: t = xs in
x + sumList t
LetG NonRec [VarG] (BopG EmptyG EmptyG)

(3,45)-(3,46)
x
VarG

*)
