
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = (^) h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,20)
(7,17)-(7,22)
(7,26)-(7,62)
*)

(* type error slice
(6,6)-(7,62)
(6,12)-(6,31)
(6,18)-(6,19)
(6,18)-(6,31)
(6,20)-(6,21)
(7,6)-(7,62)
(7,17)-(7,20)
(7,17)-(7,22)
(7,39)-(7,53)
(7,39)-(7,62)
(7,54)-(7,55)
(7,56)-(7,60)
*)
