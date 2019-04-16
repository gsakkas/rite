
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,71)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,71)
(3,9)-(3,18)
(3,11)-(3,18)
(3,15)-(3,16)
(3,15)-(3,18)
(3,22)-(3,71)
(3,33)-(3,40)
(3,33)-(3,43)
(3,41)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
(3,69)-(3,71)
*)
