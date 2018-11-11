
let pipe fs = let f a x y = a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,75)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
LamG (LetG NonRec [EmptyG] EmptyG)

(2,24)-(2,29)
x a
AppG [VarG]

(2,28)-(2,29)
x
VarG

*)
