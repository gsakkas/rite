
let pipe fs num =
  let f a x = match x with | [] -> (fun d  -> a) | h::t -> h in
  let base = num in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base i = i in List.fold_left f base fs;;

*)

(* changed spans
(2,13)-(4,45)
(3,15)-(3,61)
(3,21)-(3,22)
(3,37)-(3,48)
(3,60)-(3,61)
(4,3)-(4,45)
(4,14)-(4,17)
(4,21)-(4,45)
*)

(* type error slice
(3,3)-(4,45)
(3,9)-(3,61)
(3,11)-(3,61)
(3,15)-(3,61)
(3,37)-(3,48)
(3,47)-(3,48)
(4,21)-(4,35)
(4,21)-(4,45)
(4,36)-(4,37)
*)
