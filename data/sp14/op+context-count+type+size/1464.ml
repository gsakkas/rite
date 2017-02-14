
let pipe fs =
  let f a x = a x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,2)-(4,69)
(4,13)-(4,21)
(4,13)-(4,41)
(4,22)-(4,41)
(4,45)-(4,69)
*)

(* type error slice
(3,2)-(4,69)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,15)
(3,14)-(3,17)
(4,45)-(4,59)
(4,45)-(4,69)
(4,60)-(4,61)
*)
