
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> t in
  let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
(3,20)-(3,21)
(3,35)-(3,36)
(3,47)-(3,48)
(4,2)-(4,44)
(4,11)-(4,16)
(4,15)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,2)-(4,44)
(3,8)-(3,48)
(3,14)-(3,48)
(3,14)-(3,48)
(3,14)-(3,48)
(3,14)-(3,48)
(3,35)-(3,36)
(3,47)-(3,48)
(4,2)-(4,44)
(4,11)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
