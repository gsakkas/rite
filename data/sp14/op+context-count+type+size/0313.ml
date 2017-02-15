
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
(7,17)-(7,19)
(7,23)-(7,60)
(7,31)-(7,33)
*)

(* type error slice
(6,6)-(7,60)
(6,12)-(6,31)
(6,22)-(6,31)
(6,27)-(6,28)
(6,29)-(6,30)
(7,6)-(7,60)
(7,17)-(7,19)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
*)
