
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = "" in let l = "" in List.fold_left f base l;;


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
AppG (fromList [VarG])

(7,6)-(7,60)
x
VarG

(7,6)-(7,60)
(^)
VarG

(7,6)-(7,60)
a
VarG

(7,17)-(7,19)
sepConcat sep t
AppG (fromList [VarG])

(7,23)-(7,60)
sepConcat
VarG

(7,23)-(7,60)
sep
VarG

(7,23)-(7,60)
t
VarG

(7,31)-(7,33)
t
VarG

*)
