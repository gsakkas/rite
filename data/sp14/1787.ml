
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h t | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,42)-(4,43)
h
VarG

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,24)
(3,11)-(3,24)
(3,19)-(3,24)
(3,20)-(3,21)
(4,14)-(4,65)
(4,38)-(4,39)
(4,38)-(4,43)
(4,42)-(4,43)
*)
