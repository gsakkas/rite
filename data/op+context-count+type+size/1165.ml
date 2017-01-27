
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
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
(6,19)-(6,22)
(7,18)-(7,21)
(7,18)-(7,23)
*)

(* type error slice
(3,3)-(7,63)
(6,7)-(7,63)
(6,13)-(6,26)
(6,15)-(6,26)
(6,19)-(6,22)
(6,19)-(6,26)
(6,23)-(6,24)
(6,25)-(6,26)
(7,7)-(7,63)
(7,18)-(7,21)
(7,18)-(7,23)
(7,22)-(7,23)
(7,27)-(7,63)
(7,35)-(7,36)
(7,40)-(7,54)
(7,40)-(7,63)
(7,55)-(7,56)
(7,57)-(7,61)
(7,62)-(7,63)
*)
