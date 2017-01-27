
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f 0 h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,40)-(4,41)
(4,53)-(4,64)
*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,17)-(3,18)
(3,17)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
(4,38)-(4,39)
(4,38)-(4,43)
(4,40)-(4,41)
(4,42)-(4,43)
*)
