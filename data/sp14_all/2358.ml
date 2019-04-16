
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t then "" else "a" in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else "" in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,21)-(7,22)
t = []
BopG VarG (ListG (fromList []))

(7,28)-(7,30)
"A"
LitG

(7,36)-(7,39)
""
LitG

*)

(* type error slice
(3,3)-(8,44)
(7,18)-(7,39)
(7,21)-(7,22)
*)
