
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = t in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,19)
sep
VarG

*)

(* type error slice
(3,3)-(7,60)
(6,7)-(7,60)
(6,13)-(6,32)
(6,19)-(6,20)
(6,19)-(6,32)
(6,21)-(6,22)
(7,7)-(7,60)
(7,18)-(7,19)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
*)
