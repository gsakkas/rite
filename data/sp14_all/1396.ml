
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h ^ sep in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,26)
sep ^ x
AppG [VarG,VarG]

(7,18)-(7,25)
h
VarG

(7,37)-(7,38)
sl
VarG

*)

(* type error slice
(7,18)-(7,19)
(7,18)-(7,25)
(7,20)-(7,21)
(7,29)-(7,65)
(7,37)-(7,38)
(7,42)-(7,56)
(7,42)-(7,65)
(7,64)-(7,65)
*)
