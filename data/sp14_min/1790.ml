
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f t h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,62)-(4,63)
fun x -> x
LamG VarPatG VarG

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,24)
(3,17)-(3,18)
(3,17)-(3,24)
(4,14)-(4,65)
(4,60)-(4,61)
(4,60)-(4,65)
(4,62)-(4,63)
*)
