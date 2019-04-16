
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = [] in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,20)
sep
VarG

*)

(* type error slice
(6,7)-(7,61)
(6,13)-(6,32)
(6,23)-(6,32)
(6,28)-(6,29)
(6,30)-(6,31)
(7,7)-(7,61)
(7,18)-(7,20)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
(7,55)-(7,59)
*)
