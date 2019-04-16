
let pipe fs = let f a x = fs a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(2,15)-(2,76)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,15)-(2,76)
(2,21)-(2,31)
(2,27)-(2,29)
(2,27)-(2,31)
(2,30)-(2,31)
(2,35)-(2,76)
(2,46)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)
