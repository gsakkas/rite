
let pipe fs =
  let f a x = x a in let base a = fs a in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,66)
(3,30)-(3,38)
(3,34)-(3,36)
(3,34)-(3,38)
(3,37)-(3,38)
*)

(* type error slice
(3,34)-(3,36)
(3,34)-(3,38)
(3,42)-(3,56)
(3,42)-(3,66)
(3,64)-(3,66)
*)

(* all spans
(2,9)-(3,66)
(3,2)-(3,66)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(3,21)-(3,66)
(3,30)-(3,38)
(3,34)-(3,38)
(3,34)-(3,36)
(3,37)-(3,38)
(3,42)-(3,66)
(3,42)-(3,56)
(3,57)-(3,58)
(3,59)-(3,63)
(3,64)-(3,66)
*)
