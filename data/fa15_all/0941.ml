
let pipe fs =
  let f a x = a (x + x) in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,68)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,24)
(3,11)-(3,24)
(3,15)-(3,16)
(3,15)-(3,24)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
*)
