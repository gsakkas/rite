
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ t) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,30)
*)

(* type error slice
(3,2)-(7,60)
(3,2)-(7,60)
(6,22)-(6,31)
(6,27)-(6,28)
(6,29)-(6,30)
*)
