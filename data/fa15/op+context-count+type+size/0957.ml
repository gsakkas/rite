
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
(7,17)-(7,30)
(7,17)-(7,32)
(7,36)-(7,72)
*)

(* type error slice
(3,2)-(7,72)
(3,2)-(7,72)
(6,6)-(7,72)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,22)-(6,23)
(7,17)-(7,30)
(7,17)-(7,32)
(7,31)-(7,32)
(7,36)-(7,72)
(7,44)-(7,45)
(7,49)-(7,63)
(7,49)-(7,72)
(7,64)-(7,65)
(7,71)-(7,72)
*)
