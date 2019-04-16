
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat sep t)) in
      let base = t in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,20)
a
VarG

(6,30)-(6,47)
x
VarG

(7,18)-(7,19)
sep
VarG

(8,15)-(8,43)
t
VarG

*)

(* type error slice
(3,3)-(8,70)
(6,7)-(8,70)
(6,13)-(6,48)
(6,15)-(6,48)
(6,19)-(6,48)
(6,21)-(6,22)
(7,7)-(8,70)
(7,18)-(7,19)
(8,47)-(8,61)
(8,47)-(8,70)
(8,62)-(8,63)
(8,64)-(8,68)
*)
