
let pipe fs = let f a x = fs a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,77)
(2,26)-(2,28)
(2,26)-(2,32)
(2,29)-(2,30)
(2,31)-(2,32)
(2,36)-(2,77)
(2,47)-(2,49)
(2,53)-(2,77)
*)

(* type error slice
(2,26)-(2,28)
(2,26)-(2,32)
(2,53)-(2,67)
(2,53)-(2,77)
(2,75)-(2,77)
*)
