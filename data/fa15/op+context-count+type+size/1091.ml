
let pipe fs =
  let f a x = [x + a] in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x b = x b in let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,66)
(3,14)-(3,21)
(3,15)-(3,16)
(3,15)-(3,20)
(3,19)-(3,20)
(3,25)-(3,66)
(3,36)-(3,38)
(3,42)-(3,66)
*)

(* type error slice
(3,2)-(3,66)
(3,8)-(3,21)
(3,10)-(3,21)
(3,14)-(3,21)
(3,15)-(3,20)
(3,19)-(3,20)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
*)
