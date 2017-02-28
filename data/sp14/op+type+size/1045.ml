
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

(* all spans
(2,18)-(7,62)
(2,22)-(7,62)
(3,2)-(7,62)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,62)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(7,62)
(7,17)-(7,22)
(7,17)-(7,20)
(7,21)-(7,22)
(7,26)-(7,62)
(7,34)-(7,35)
(7,39)-(7,62)
(7,39)-(7,53)
(7,54)-(7,55)
(7,56)-(7,60)
(7,61)-(7,62)
*)
