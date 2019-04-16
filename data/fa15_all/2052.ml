
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat (sep, x)) in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,43)
sep
VarG

(7,18)-(7,20)
h
VarG

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(6,7)-(7,60)
(6,13)-(6,43)
(6,19)-(6,20)
(6,19)-(6,43)
(6,21)-(6,22)
(6,23)-(6,43)
(6,24)-(6,33)
(6,34)-(6,42)
(6,35)-(6,38)
(7,7)-(7,60)
(7,18)-(7,20)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
*)
