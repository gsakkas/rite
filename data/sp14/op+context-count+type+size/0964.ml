
let pipe fs =
  let f a x = a = (fun x  -> fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,16)
(3,15)-(3,46)
(3,20)-(3,46)
(4,3)-(4,45)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,46)
(3,15)-(3,46)
(3,20)-(3,46)
(3,30)-(3,46)
(3,40)-(3,41)
(3,40)-(3,46)
(3,43)-(3,44)
(3,43)-(3,46)
(3,45)-(3,46)
*)
