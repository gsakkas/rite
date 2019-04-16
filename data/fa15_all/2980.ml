
let stringOfList f l = let base = f in List.fold_left f base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(2,24)-(2,63)
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,24)-(2,63)
(2,35)-(2,36)
(2,40)-(2,54)
(2,40)-(2,63)
(2,55)-(2,56)
(2,57)-(2,61)
*)
