
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
(4,61)-(4,62)
(4,63)-(4,64)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,23)
(3,10)-(3,23)
(3,18)-(3,23)
(3,19)-(3,20)
(4,13)-(4,64)
(4,13)-(4,64)
(4,59)-(4,60)
(4,59)-(4,64)
(4,63)-(4,64)
*)
