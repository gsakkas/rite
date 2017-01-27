
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = f in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,45)-(7,46)
*)

(* type error slice
(6,7)-(7,73)
(6,13)-(6,24)
(6,15)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,21)-(6,22)
(6,23)-(6,24)
(7,7)-(7,73)
(7,37)-(7,73)
(7,45)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,65)-(7,66)
(7,67)-(7,71)
(7,72)-(7,73)
*)
