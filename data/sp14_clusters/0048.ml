
let pipe fs = let f a x = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base n = 0 in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,73)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = fun n -> 0 in
   List.fold_left f base fs)
LamG (LetG NonRec [EmptyG] EmptyG)

(2,33)-(2,73)
a
VarG

(2,44)-(2,45)
fun n -> 0
LamG LitG

*)
