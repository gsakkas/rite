
let pipe fs =
  let f a x = a + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,70)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,24)
(3,15)-(3,16)
(3,15)-(3,24)
(3,28)-(3,70)
(3,37)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
