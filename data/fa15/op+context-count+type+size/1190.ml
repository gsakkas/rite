
let pipe fs =
  let f a x = (x + x) + a in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
(3,14)-(3,25)
(3,15)-(3,16)
(3,19)-(3,20)
(3,24)-(3,25)
(3,29)-(3,70)
(3,40)-(3,42)
(3,46)-(3,70)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,25)
(3,14)-(3,25)
(3,24)-(3,25)
(3,29)-(3,70)
(3,40)-(3,42)
(3,46)-(3,60)
(3,46)-(3,70)
(3,61)-(3,62)
(3,63)-(3,67)
*)
