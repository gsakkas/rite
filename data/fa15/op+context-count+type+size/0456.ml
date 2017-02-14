
let pipe fs =
  let f a x = x a in
  let base = match fs with | (h::t,z) -> z in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,71)
(3,9)-(3,18)
(4,3)-(4,71)
(4,14)-(4,43)
(4,20)-(4,22)
*)

(* type error slice
(4,14)-(4,43)
(4,20)-(4,22)
(4,47)-(4,61)
(4,47)-(4,71)
(4,69)-(4,71)
*)
