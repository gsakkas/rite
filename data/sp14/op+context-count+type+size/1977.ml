
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
(4,39)-(4,40)
(4,51)-(4,64)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,23)
(3,16)-(3,17)
(3,16)-(3,23)
(4,37)-(4,38)
(4,37)-(4,42)
(4,39)-(4,40)
*)
