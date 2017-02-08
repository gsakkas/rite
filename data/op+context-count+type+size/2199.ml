
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,14)-(4,62)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(5,3)-(5,27)
*)

(* type error slice
(4,3)-(5,27)
(4,14)-(4,62)
(4,38)-(4,39)
(4,38)-(4,41)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
(5,20)-(5,24)
*)
