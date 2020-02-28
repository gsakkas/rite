
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = string_of_int h in let l = t in List.fold_left f base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,33)
h
VarG

*)

(* type error slice
(3,3)-(7,73)
(6,7)-(7,73)
(6,13)-(6,24)
(6,15)-(6,24)
(6,19)-(6,24)
(6,21)-(6,22)
(6,23)-(6,24)
(7,18)-(7,31)
(7,18)-(7,33)
(7,32)-(7,33)
(7,37)-(7,73)
(7,45)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,65)-(7,66)
(7,72)-(7,73)
*)
