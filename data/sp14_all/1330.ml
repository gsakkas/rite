
let pipe fs =
  let f a x = (a x) + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(3,74)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,74)
(3,9)-(3,28)
(3,11)-(3,28)
(3,15)-(3,20)
(3,15)-(3,28)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,28)
(3,24)-(3,25)
(3,26)-(3,27)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
*)
