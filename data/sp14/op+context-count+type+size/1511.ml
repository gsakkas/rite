
let rec listReverse l =
  match l with | [] -> [] | a::b -> [listReverse b; [a]];;


(* fix

let rec listReverse l = match l with | [] -> [] | b::[] -> [b];;

*)

(* changed spans
(3,2)-(3,56)
(3,36)-(3,56)
(3,37)-(3,48)
(3,37)-(3,50)
(3,49)-(3,50)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,36)-(3,56)
(3,36)-(3,56)
(3,37)-(3,48)
(3,37)-(3,50)
*)
