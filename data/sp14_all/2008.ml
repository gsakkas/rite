
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,70)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,40)-(3,42)
p
VarG

*)
