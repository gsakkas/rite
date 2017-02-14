
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ t) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,30)-(6,31)
(7,18)-(7,19)
(7,23)-(7,60)
(7,31)-(7,33)
*)

(* type error slice
(3,3)-(7,60)
(3,3)-(7,60)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
*)
