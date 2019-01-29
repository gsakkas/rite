
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,43)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,14)-(3,45)
x a
AppG (fromList [VarG])

(3,44)-(3,45)
a
VarG

(4,13)-(4,15)
n
VarG

*)
