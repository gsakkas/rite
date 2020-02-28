
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,43)
t
VarG

*)

(* type error slice
(2,4)-(7,72)
(2,19)-(7,70)
(3,3)-(7,70)
(6,23)-(6,32)
(6,24)-(6,27)
(6,28)-(6,29)
(7,32)-(7,41)
(7,32)-(7,43)
(7,42)-(7,43)
*)
