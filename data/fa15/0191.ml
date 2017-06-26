
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
*)

(* type error slice
(3,2)-(5,11)
(3,8)-(3,17)
*)

(* all spans
(2,15)-(5,11)
(3,2)-(5,11)
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
(3,15)-(3,16)
(4,18)-(4,56)
(4,21)-(4,27)
(4,21)-(4,22)
(4,25)-(4,27)
(4,33)-(4,35)
(4,41)-(4,56)
(4,41)-(4,46)
(4,47)-(4,56)
(4,48)-(4,49)
(4,51)-(4,52)
(4,54)-(4,55)
(5,10)-(5,11)
*)
