
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,14)
fun x -> x
LamG VarG

(4,18)-(4,42)
x
VarG

*)
