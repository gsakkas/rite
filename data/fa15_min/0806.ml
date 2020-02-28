
let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> let r = listReverse t in r @ [h];;

*)

(* changed spans
(3,62)-(3,68)
r @ [h]
AppG [VarG,ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,70)
(2,21)-(3,68)
(3,3)-(3,68)
(3,37)-(3,68)
(3,45)-(3,56)
(3,45)-(3,58)
(3,62)-(3,63)
(3,62)-(3,68)
*)
