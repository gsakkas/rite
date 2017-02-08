
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> x a) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,43)
(3,20)-(3,43)
(3,30)-(3,43)
(3,42)-(3,43)
(4,3)-(4,45)
(4,12)-(4,17)
*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,43)
(3,11)-(3,43)
(3,15)-(3,16)
(3,15)-(3,43)
(3,15)-(3,43)
(3,15)-(3,43)
(3,20)-(3,43)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
