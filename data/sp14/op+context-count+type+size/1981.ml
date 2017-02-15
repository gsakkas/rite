
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
(4,13)-(4,62)
(4,37)-(4,38)
(4,37)-(4,40)
(4,39)-(4,40)
(5,2)-(5,26)
*)

(* type error slice
(4,2)-(5,26)
(4,13)-(4,62)
(4,37)-(4,38)
(4,37)-(4,40)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
(5,19)-(5,23)
*)
