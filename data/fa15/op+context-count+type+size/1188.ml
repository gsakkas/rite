
let pipe fs = let f a x = a + fs in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
(2,26)-(2,27)
(2,26)-(2,32)
(2,30)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,26)-(2,32)
(2,30)-(2,32)
(2,52)-(2,66)
(2,52)-(2,76)
(2,74)-(2,76)
*)
