
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ x in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,21)-(6,22)
(6,23)-(6,24)
(7,31)-(7,33)
*)

(* type error slice
(3,3)-(7,60)
(3,3)-(7,60)
(4,11)-(4,13)
(6,7)-(7,60)
(6,7)-(7,60)
(6,13)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,21)-(6,22)
(7,7)-(7,60)
(7,23)-(7,60)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)
