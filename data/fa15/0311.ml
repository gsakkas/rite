
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sl in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,20)
h
VarG

(8,15)-(8,43)
t
VarG

*)

(* type error slice
(3,3)-(8,70)
(3,9)-(3,11)
(6,7)-(8,70)
(6,13)-(6,24)
(6,19)-(6,24)
(6,21)-(6,22)
(6,23)-(6,24)
(7,7)-(8,70)
(7,18)-(7,20)
(8,47)-(8,61)
(8,47)-(8,70)
(8,62)-(8,63)
(8,64)-(8,68)
*)
