
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,31)-(6,34)
(6,33)-(6,34)
(7,31)-(7,33)
*)

(* type error slice
(6,7)-(7,60)
(6,13)-(6,34)
(6,15)-(6,34)
(6,19)-(6,34)
(6,21)-(6,22)
(6,31)-(6,32)
(6,31)-(6,34)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)
