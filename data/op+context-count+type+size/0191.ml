
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> t in
  let base x = x in List.fold_left f base fs;;



let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,20)
(3,23)-(3,35)
(3,38)-(3,49)
(4,12)-(4,13)
(4,16)-(4,17)
*)

(* type error slice
(4,21)-(4,45)
*)
