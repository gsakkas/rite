
let stringOfList f l =
  let fx a b = match b with | [] -> [] | h::t -> List.append a (f b) in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,16)-(3,68)
(3,22)-(3,23)
(3,37)-(3,39)
(3,50)-(3,61)
(3,65)-(3,66)
(3,65)-(3,68)
(4,3)-(4,44)
*)

(* type error slice
(3,3)-(4,44)
(3,10)-(3,68)
(3,50)-(3,61)
(3,50)-(3,68)
(3,62)-(3,63)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,37)
(4,38)-(4,42)
*)
