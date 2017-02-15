
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
(7,31)-(7,34)
*)

(* type error slice
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(7,23)-(7,61)
(7,31)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,60)-(7,61)
*)
