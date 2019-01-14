
let rec sumList xs =
  if xs = [] then 0 else (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,25)-(3,37)
h
VarG

(3,25)-(3,60)
xs
VarG

(3,25)-(3,60)
let h :: t = xs in
h + sumList t
LetG NonRec (fromList [VarG]) (BopG EmptyG EmptyG)

(3,57)-(3,59)
t
VarG

*)
