
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,33)
sl
VarG

*)

(* type error slice
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,59)-(7,60)
*)
