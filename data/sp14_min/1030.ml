
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append (List.append a sep) h in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,52)
a ^ sep
AppG [VarG,VarG]

(7,18)-(7,20)
h
VarG

(7,32)-(7,34)
t
VarG

*)

(* type error slice
(6,7)-(7,61)
(6,13)-(6,52)
(6,31)-(6,50)
(6,32)-(6,43)
(6,44)-(6,45)
(7,7)-(7,61)
(7,18)-(7,20)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
(7,55)-(7,59)
*)
