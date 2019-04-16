
let stringOfList f l =
  let fx a b = match b with | [] -> "" | h::t -> List.append a b in
  let base = "" in List.fold_left fx base l;;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,16)-(3,65)
a ^ b
AppG (fromList [VarG])

*)

(* type error slice
(3,16)-(3,65)
(3,37)-(3,39)
(3,50)-(3,61)
(3,50)-(3,65)
*)
