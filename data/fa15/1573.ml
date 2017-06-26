
let rec listReverse l =
  match l with | [] -> [] | (h::tail)::[] -> listReverse tail;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

*)

(* changed spans
(3,2)-(3,61)
(3,45)-(3,61)
*)

(* type error slice
(2,3)-(3,63)
(2,20)-(3,61)
(3,2)-(3,61)
(3,8)-(3,9)
(3,45)-(3,56)
(3,45)-(3,61)
(3,57)-(3,61)
*)

(* all spans
(2,20)-(3,61)
(3,2)-(3,61)
(3,8)-(3,9)
(3,23)-(3,25)
(3,45)-(3,61)
(3,45)-(3,56)
(3,57)-(3,61)
*)
