
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else t in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,42)-(7,43)
h
VarG

*)

(* type error slice
(3,3)-(8,44)
(7,18)-(7,43)
(7,33)-(7,36)
(7,42)-(7,43)
*)
