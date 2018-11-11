
let pipe fs =
  let f a x g b y z = match y with | [] -> z | _ -> b a in
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
LamG (LetG NonRec [EmptyG] EmptyG)

(3,52)-(3,53)
x
VarG

(4,17)-(4,19)
n
VarG

*)
