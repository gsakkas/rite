
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
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
(7,44)-(7,46)
*)

(* type error slice
(7,36)-(7,73)
(7,44)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,72)-(7,73)
*)

(* all spans
(2,18)-(7,73)
(2,22)-(7,73)
(3,2)-(7,73)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,73)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(7,73)
(7,17)-(7,32)
(7,17)-(7,26)
(7,27)-(7,30)
(7,31)-(7,32)
(7,36)-(7,73)
(7,44)-(7,46)
(7,50)-(7,73)
(7,50)-(7,64)
(7,65)-(7,66)
(7,67)-(7,71)
(7,72)-(7,73)
*)
