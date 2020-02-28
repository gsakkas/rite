
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x c = a ^ (sep ^ x) in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(6,17)-(6,34)
a ^ (sep ^ x)
AppG [VarG,AppG [EmptyG,EmptyG]]

(7,32)-(7,34)
[]
ListG []

*)

(* type error slice
(6,7)-(7,61)
(6,13)-(6,34)
(6,15)-(6,34)
(6,17)-(6,34)
(6,21)-(6,22)
(6,21)-(6,34)
(6,23)-(6,24)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
*)
