
let pipe fs p =
  let f a x = x (a p) in let base = p in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x p = x (a p) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(2,12)-(3,65)
(3,14)-(3,21)
(3,25)-(3,65)
(3,36)-(3,37)
(3,41)-(3,65)
*)

(* type error slice
(3,2)-(3,65)
(3,8)-(3,21)
(3,16)-(3,21)
(3,17)-(3,18)
(3,19)-(3,20)
(3,25)-(3,65)
(3,36)-(3,37)
(3,41)-(3,55)
(3,41)-(3,65)
(3,56)-(3,57)
(3,58)-(3,62)
*)
