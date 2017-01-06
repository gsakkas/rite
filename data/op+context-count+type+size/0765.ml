
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t then "" else "a" in
      let l = sl in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else "" in
      let l = sl in List.fold_left f base l;;


(* changed spans
(7,28)-(7,30)
(7,36)-(7,39)
*)

(* type error slice
(3,3)-(8,44)
(7,18)-(7,39)
*)
