
let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> (listHelper t h) :: l2 in
  listHelper l [];;


(* fix

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

*)

(* changed spans
(4,39)-(4,61)
listHelper t (h :: l2)
AppG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(5,18)
(3,22)-(4,61)
(3,24)-(4,61)
(4,5)-(4,61)
(4,26)-(4,28)
(4,39)-(4,55)
(4,39)-(4,61)
(4,40)-(4,50)
(4,59)-(4,61)
*)
