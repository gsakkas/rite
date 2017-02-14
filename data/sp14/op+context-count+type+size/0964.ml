
let pipe fs =
  let f a x = a = (fun x  -> fun y  -> x (a y)) in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,15)
(3,14)-(3,47)
(3,18)-(3,47)
(4,2)-(4,44)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,47)
(3,14)-(3,47)
(3,18)-(3,47)
(3,29)-(3,46)
(3,39)-(3,40)
(3,39)-(3,46)
(3,41)-(3,46)
(3,42)-(3,43)
(3,44)-(3,45)
*)
