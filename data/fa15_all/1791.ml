
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> 0 | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base =
    match fs with | [] -> (fun x  -> x * 1) | h::t -> f (fun x  -> x * 1) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,35)-(4,36)
fun x -> x * 1
LamG (BopG EmptyG EmptyG)

(4,47)-(4,64)
x
VarG

(4,47)-(4,64)
x * 1
BopG VarG LitG

(4,47)-(4,64)
1
LitG

(4,60)-(4,61)
x * 1
BopG VarG LitG

(4,63)-(4,64)
1
LitG

*)
