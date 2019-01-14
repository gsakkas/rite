
let pipe fs = let f a x = x a in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs b = let f a x = x a in let base = b in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,74)
fun b ->
  (let f =
     fun a -> fun x -> x a in
   let base = b in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,44)-(2,46)
b
VarG

*)
