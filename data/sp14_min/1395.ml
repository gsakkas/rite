
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,22)
x
VarG

(7,18)-(7,20)
h
VarG

(7,32)-(7,33)
t
VarG

*)

(* type error slice
(6,7)-(7,60)
(6,13)-(6,22)
(6,15)-(6,22)
(6,19)-(6,20)
(6,19)-(6,22)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)
