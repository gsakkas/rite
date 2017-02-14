
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,45)
(3,14)-(3,39)
(3,20)-(3,22)
(4,2)-(4,45)
(4,13)-(4,14)
(4,13)-(4,17)
(4,15)-(4,17)
(4,21)-(4,45)
*)

(* type error slice
(4,2)-(4,45)
(4,13)-(4,14)
(4,13)-(4,17)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
(4,38)-(4,42)
*)
