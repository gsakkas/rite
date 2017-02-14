
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
(6,19)-(6,47)
(6,22)-(6,23)
(6,22)-(6,29)
(6,26)-(6,29)
*)

(* type error slice
(6,19)-(6,47)
(6,19)-(6,47)
(6,19)-(6,47)
(6,35)-(6,47)
(6,37)-(6,38)
*)
