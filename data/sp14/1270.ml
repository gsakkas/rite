
let pipe fs =
  let f a x = x a in let base = List.hd fs in List.fold_left f base fs;;


(* fix

let pipe fs p = let f a x = x a in let base = p in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,70)
(3,32)-(3,39)
(3,32)-(3,42)
(3,40)-(3,42)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,15)
(3,14)-(3,17)
(3,21)-(3,70)
(3,32)-(3,39)
(3,32)-(3,42)
(3,40)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
(3,68)-(3,70)
*)

(* all spans
(2,9)-(3,70)
(3,2)-(3,70)
(3,8)-(3,17)
(3,10)-(3,17)
(3,14)-(3,17)
(3,14)-(3,15)
(3,16)-(3,17)
(3,21)-(3,70)
(3,32)-(3,42)
(3,32)-(3,39)
(3,40)-(3,42)
(3,46)-(3,70)
(3,46)-(3,60)
(3,61)-(3,62)
(3,63)-(3,67)
(3,68)-(3,70)
*)
