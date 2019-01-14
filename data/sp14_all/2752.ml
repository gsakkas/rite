
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) = 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,51)
a ^ (x ^ sep)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,21)-(6,40)
List.length t < 2
BopG (AppG (fromList [EmptyG])) LitG

(7,6)-(7,60)
a
VarG

(7,6)-(7,60)
(^)
VarG

(7,6)-(7,60)
x
VarG

(7,6)-(7,60)
(^)
VarG

(7,6)-(7,60)
sep
VarG

(7,6)-(7,60)
x ^ sep
AppG (fromList [VarG])

*)
