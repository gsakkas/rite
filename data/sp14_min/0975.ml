
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h "to be implemented" in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,39)
h
VarG

*)

(* type error slice
(3,3)-(8,43)
(6,7)-(8,43)
(6,13)-(6,32)
(6,15)-(6,32)
(6,23)-(6,32)
(6,28)-(6,29)
(6,30)-(6,31)
(7,18)-(7,19)
(7,18)-(7,39)
(8,7)-(8,43)
(8,15)-(8,16)
(8,20)-(8,34)
(8,20)-(8,43)
(8,35)-(8,36)
(8,42)-(8,43)
*)
