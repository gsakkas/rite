
let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = l then d else assoc (d, k, (t :: l));;


(* fix

let rec assoc (d,k,l) =
  match [(k, d)] with
  | [] -> d
  | h::t -> if (k, d) = h then d else assoc (d, k, t);;

*)

(* changed spans
(5,25)-(5,26)
h
VarG

(5,52)-(5,60)
t
VarG

*)

(* type error slice
(2,4)-(5,63)
(2,16)-(5,61)
(5,16)-(5,22)
(5,16)-(5,26)
(5,25)-(5,26)
(5,39)-(5,44)
(5,39)-(5,61)
(5,45)-(5,61)
(5,52)-(5,60)
(5,58)-(5,59)
*)
