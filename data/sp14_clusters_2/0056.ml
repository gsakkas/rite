
let pipe fs =
  let f a x a x =
    match x with | (x',y) -> (match x' with | [] -> y | _ -> x' a) in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(5,47)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,61)-(4,63)
x
VarG

(5,17)-(5,19)
n
VarG

*)
