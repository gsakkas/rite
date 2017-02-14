
let pipe fs =
  let f a x = match x with | [] -> [] | h::t -> h in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,50)
(3,21)-(3,22)
(3,36)-(3,38)
(3,49)-(3,50)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,50)
(3,11)-(3,50)
(3,15)-(3,50)
(3,36)-(3,38)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
