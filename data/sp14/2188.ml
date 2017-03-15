
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev x) ^ a in
      let base = sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,30)
(6,19)-(6,27)
(7,17)-(7,20)
*)

(* type error slice
(6,18)-(6,30)
(6,18)-(6,34)
(6,19)-(6,27)
(6,31)-(6,32)
*)

(* all spans
(2,18)-(7,61)
(2,22)-(7,61)
(3,2)-(7,61)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,61)
(6,12)-(6,34)
(6,14)-(6,34)
(6,18)-(6,34)
(6,31)-(6,32)
(6,18)-(6,30)
(6,19)-(6,27)
(6,28)-(6,29)
(6,33)-(6,34)
(7,6)-(7,61)
(7,17)-(7,20)
(7,24)-(7,61)
(7,32)-(7,34)
(7,38)-(7,61)
(7,38)-(7,52)
(7,53)-(7,54)
(7,55)-(7,59)
(7,60)-(7,61)
*)
