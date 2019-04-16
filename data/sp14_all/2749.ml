
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,35)
sl
VarG

*)

(* type error slice
(6,23)-(6,32)
(6,24)-(6,27)
(6,28)-(6,29)
(7,24)-(7,62)
(7,32)-(7,35)
(7,39)-(7,53)
(7,39)-(7,62)
(7,61)-(7,62)
*)
