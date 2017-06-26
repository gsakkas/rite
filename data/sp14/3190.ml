
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in
      let base = "" in let l = h ^ t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,32)
(7,31)-(7,36)
(7,33)-(7,34)
*)

(* type error slice
(3,2)-(7,63)
(7,31)-(7,36)
(7,33)-(7,34)
(7,35)-(7,36)
*)

(* all spans
(2,18)-(7,63)
(2,22)-(7,63)
(3,2)-(7,63)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,63)
(6,12)-(6,19)
(6,14)-(6,19)
(6,18)-(6,19)
(7,6)-(7,63)
(7,17)-(7,19)
(7,23)-(7,63)
(7,31)-(7,36)
(7,33)-(7,34)
(7,31)-(7,32)
(7,35)-(7,36)
(7,40)-(7,63)
(7,40)-(7,54)
(7,55)-(7,56)
(7,57)-(7,61)
(7,62)-(7,63)
*)
