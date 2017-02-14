
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> fun t  -> x (a t)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,56)
(3,20)-(3,56)
(3,30)-(3,56)
(3,40)-(3,56)
(3,55)-(3,56)
(4,3)-(4,45)
(4,12)-(4,17)
*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,56)
(3,11)-(3,56)
(3,15)-(3,16)
(3,15)-(3,56)
(3,15)-(3,56)
(3,15)-(3,56)
(3,20)-(3,56)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
