
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep [] in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,20)
(7,6)-(7,74)
(7,31)-(7,33)
(7,45)-(7,47)
*)

(* type error slice
(7,37)-(7,74)
(7,45)-(7,47)
(7,51)-(7,65)
(7,51)-(7,74)
(7,73)-(7,74)
*)

(* all spans
(2,18)-(7,74)
(2,22)-(7,74)
(3,2)-(7,74)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,74)
(6,12)-(6,20)
(6,14)-(6,20)
(6,18)-(6,20)
(7,6)-(7,74)
(7,17)-(7,33)
(7,17)-(7,26)
(7,27)-(7,30)
(7,31)-(7,33)
(7,37)-(7,74)
(7,45)-(7,47)
(7,51)-(7,74)
(7,51)-(7,65)
(7,66)-(7,67)
(7,68)-(7,72)
(7,73)-(7,74)
*)
