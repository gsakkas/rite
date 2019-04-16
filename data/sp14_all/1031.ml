
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append (List.append a sep) h in
      let base = t in let l = sl in List.fold_left f base l;;


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
AppG (fromList [VarG])

(7,18)-(7,19)
h
VarG

(7,31)-(7,33)
t
VarG

*)

(* type error slice
(3,3)-(7,60)
(6,7)-(7,60)
(6,13)-(6,52)
(6,19)-(6,30)
(6,19)-(6,52)
(6,31)-(6,50)
(6,32)-(6,43)
(6,44)-(6,45)
(6,51)-(6,52)
(7,7)-(7,60)
(7,18)-(7,19)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
*)
