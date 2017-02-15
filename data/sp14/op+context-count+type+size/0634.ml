
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t then "" else "a" in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else "" in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,20)-(7,21)
(7,27)-(7,29)
(7,35)-(7,38)
*)

(* type error slice
(3,2)-(8,43)
(3,2)-(8,43)
(7,17)-(7,38)
(7,20)-(7,21)
*)
