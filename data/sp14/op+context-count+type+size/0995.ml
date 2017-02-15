
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if a = "a" then a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,47)
(6,21)-(6,22)
(6,21)-(6,28)
(6,25)-(6,28)
(7,37)-(7,51)
*)

(* type error slice
(6,18)-(6,47)
(6,18)-(6,47)
(6,18)-(6,47)
(6,34)-(6,47)
(6,36)-(6,37)
*)
