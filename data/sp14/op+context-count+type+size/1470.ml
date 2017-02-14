
let pipe fs =
  let f a x = a x in
  let base = match fs with | 0 -> 0 | _ -> fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,2)-(4,73)
(4,13)-(4,45)
(4,19)-(4,21)
(4,34)-(4,35)
(4,43)-(4,45)
(4,49)-(4,73)
*)

(* type error slice
(3,2)-(4,73)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,15)
(3,14)-(3,17)
(4,49)-(4,63)
(4,49)-(4,73)
(4,64)-(4,65)
*)
