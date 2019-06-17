
let rec listReverse l = match l with | [] -> 0 | h::t -> [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,46)-(2,47)
[]
ListG []

(2,58)-(2,61)
listReverse t @ [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,25)-(2,61)
(2,46)-(2,47)
(2,58)-(2,61)
*)
