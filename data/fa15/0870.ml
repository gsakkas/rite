
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ x in
      let base = h in let l = sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,24)
a ^ (sep ^ x)
AppG [VarG,AppG [EmptyG,EmptyG]]

(7,31)-(7,34)
t
VarG

*)

(* type error slice
(3,3)-(7,61)
(4,11)-(4,13)
(6,7)-(7,61)
(6,13)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,21)-(6,22)
(7,7)-(7,61)
(7,23)-(7,61)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
*)
