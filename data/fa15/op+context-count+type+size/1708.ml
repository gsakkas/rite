
let pipe fs =
  let f a x = match x with | [] -> (fun d  -> a) | h::t -> h in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,61)
(3,21)-(3,22)
(3,37)-(3,48)
(3,60)-(3,61)
(4,3)-(4,43)
(4,14)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,3)-(4,43)
(3,9)-(3,61)
(3,11)-(3,61)
(3,15)-(3,61)
(3,37)-(3,48)
(3,47)-(3,48)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
*)
