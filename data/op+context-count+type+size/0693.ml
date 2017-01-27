
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep t in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,21)
(7,7)-(7,74)
(7,45)-(7,47)
*)

(* type error slice
(6,7)-(7,74)
(6,13)-(6,21)
(6,15)-(6,21)
(6,19)-(6,21)
(7,7)-(7,74)
(7,37)-(7,74)
(7,45)-(7,47)
(7,51)-(7,65)
(7,51)-(7,74)
(7,66)-(7,67)
(7,68)-(7,72)
(7,73)-(7,74)
*)
