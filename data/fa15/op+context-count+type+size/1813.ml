
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,44)
(3,15)-(3,49)
(3,32)-(3,33)
(3,46)-(3,47)
(3,46)-(3,49)
(3,48)-(3,49)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,49)
(3,11)-(3,49)
(3,15)-(3,49)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
