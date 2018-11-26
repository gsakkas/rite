
let pipe fs =
  let f a x = let g b y n = match n with | [] -> n | _ -> y b in g a x in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,47)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,2)-(4,47)
a
VarG

(4,17)-(4,19)
n
VarG

*)
