
let pipe fs =
  let f a x = a (x + x) in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,21)-(3,22)
a
VarG

(3,38)-(3,39)
z
VarG

*)
