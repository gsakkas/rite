
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,15)
fun x -> x
LamG VarG

(4,19)-(4,43)
x
VarG

*)
