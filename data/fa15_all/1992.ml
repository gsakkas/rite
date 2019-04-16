
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = (string_of_int a) ^ x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,36)
a
VarG

*)

(* type error slice
(6,7)-(7,59)
(6,13)-(6,40)
(6,15)-(6,40)
(6,19)-(6,36)
(6,19)-(6,40)
(6,20)-(6,33)
(6,34)-(6,35)
(6,37)-(6,38)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
