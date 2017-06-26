
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a b in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,15)-(3,64)
(3,21)-(3,22)
(3,36)-(3,38)
(3,49)-(3,60)
*)

(* type error slice
(3,15)-(3,64)
(3,36)-(3,38)
(3,49)-(3,60)
(3,49)-(3,64)
*)

(* all spans
(2,17)-(4,43)
(2,19)-(4,43)
(3,2)-(4,43)
(3,9)-(3,64)
(3,11)-(3,64)
(3,15)-(3,64)
(3,21)-(3,22)
(3,36)-(3,38)
(3,49)-(3,64)
(3,49)-(3,60)
(3,61)-(3,62)
(3,63)-(3,64)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
(4,19)-(4,33)
(4,34)-(4,36)
(4,37)-(4,41)
(4,42)-(4,43)
*)
