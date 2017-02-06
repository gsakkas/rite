
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,46)
(7,41)-(7,44)
*)

(* type error slice
(2,4)-(7,75)
(2,19)-(7,73)
(2,23)-(7,73)
(3,3)-(7,73)
(3,3)-(7,73)
(3,3)-(7,73)
(3,3)-(7,73)
(3,9)-(3,11)
(6,7)-(7,73)
(6,13)-(6,31)
(6,15)-(6,31)
(6,19)-(6,20)
(6,24)-(6,27)
(6,30)-(6,31)
(7,7)-(7,73)
(7,18)-(7,19)
(7,23)-(7,73)
(7,31)-(7,40)
(7,31)-(7,46)
(7,31)-(7,46)
(7,45)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,50)-(7,73)
(7,50)-(7,73)
(7,65)-(7,66)
(7,67)-(7,71)
(7,72)-(7,73)
*)
