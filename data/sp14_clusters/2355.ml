
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep t in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,20)
x ^ a
AppG [VarG,VarG]

(7,6)-(7,73)
x
VarG

(7,6)-(7,73)
(^)
VarG

(7,6)-(7,73)
a
VarG

(7,44)-(7,46)
t
VarG

*)
