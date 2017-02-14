
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
(6,18)-(6,35)
(6,19)-(6,32)
*)

(* type error slice
(6,6)-(7,58)
(6,12)-(6,39)
(6,14)-(6,39)
(6,18)-(6,35)
(6,18)-(6,39)
(6,19)-(6,32)
(6,33)-(6,34)
(6,36)-(6,37)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
*)
