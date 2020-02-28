
let rec listReverse l =
  match l with | [] -> [] | h::t -> [t] @ (listReverse h);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,37)-(3,40)
listReverse t
AppG [VarG]

(3,43)-(3,58)
[h]
ListG [VarG]

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,9)-(3,10)
(3,43)-(3,58)
(3,44)-(3,55)
(3,56)-(3,57)
*)
