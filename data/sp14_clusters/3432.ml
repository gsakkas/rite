
let rec listReverse l =
  if l <> [] then match l with | [] -> l | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse2 l dest =
  match l with | [] -> [] | h::t -> listReverse2 t (h :: dest);;

let rec listReverse l = listReverse2 l [];;

*)

(* changed spans
(3,2)-(3,71)
dest
VarG

(3,10)-(3,12)
fun dest ->
  match l with
  | [] -> []
  | h :: t -> listReverse2 t
                           (h :: dest)
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(3,52)-(3,63)
[]
ListG EmptyG Nothing

(3,64)-(3,65)
listReverse2
VarG

(3,64)-(3,65)
listReverse2 t (h :: dest)
AppG [VarG,ConAppG (Just (TupleG [VarG,VarG])) Nothing]

(3,70)-(3,71)
h :: dest
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)
