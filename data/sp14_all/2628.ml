
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,33)
t
VarG

*)

(* type error slice
(6,19)-(6,28)
(6,20)-(6,21)
(6,22)-(6,23)
(7,24)-(7,60)
(7,32)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,59)-(7,60)
*)
