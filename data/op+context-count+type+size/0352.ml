
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = [] in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,20)
(7,32)-(7,34)
*)

(* type error slice
(6,7)-(7,61)
(6,13)-(6,31)
(6,15)-(6,31)
(6,19)-(6,20)
(6,19)-(6,31)
(6,21)-(6,22)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
(7,7)-(7,61)
(7,18)-(7,20)
(7,24)-(7,61)
(7,32)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
(7,55)-(7,59)
(7,60)-(7,61)
*)
