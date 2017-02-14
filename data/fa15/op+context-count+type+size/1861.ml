
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ t) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
(6,29)-(6,30)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(6,22)-(6,31)
(6,27)-(6,28)
(6,29)-(6,30)
*)
