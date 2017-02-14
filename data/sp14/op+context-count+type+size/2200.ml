
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f h t in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,62)-(4,63)
(4,64)-(4,65)
*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,23)
(3,11)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(4,14)-(4,65)
(4,14)-(4,65)
(4,60)-(4,61)
(4,60)-(4,65)
(4,64)-(4,65)
*)
