
let pipe fs =
  let f a x f' d = x (a d) in let base c = c in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x d = x (a d) in let base c = c in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,26)
(3,31)-(3,73)
*)

(* type error slice
(3,3)-(3,73)
(3,9)-(3,26)
(3,11)-(3,26)
(3,13)-(3,26)
(3,16)-(3,26)
(3,23)-(3,24)
(3,23)-(3,26)
(3,25)-(3,26)
(3,31)-(3,73)
(3,40)-(3,45)
(3,44)-(3,45)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
(3,66)-(3,70)
*)
