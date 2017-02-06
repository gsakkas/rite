
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sepConcat a x) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ a) in
      let base = h ^ sep in let l = List.rev t in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,33)
(6,34)-(6,35)
(7,7)-(7,74)
*)

(* type error slice
(2,4)-(7,76)
(2,19)-(7,74)
(2,23)-(7,74)
(3,3)-(7,74)
(3,3)-(7,74)
(3,3)-(7,74)
(3,3)-(7,74)
(3,9)-(3,11)
(6,7)-(7,74)
(6,13)-(6,37)
(6,15)-(6,37)
(6,19)-(6,20)
(6,24)-(6,33)
(6,24)-(6,37)
(6,24)-(6,37)
(6,24)-(6,37)
(6,34)-(6,35)
(6,36)-(6,37)
(7,18)-(7,19)
(7,22)-(7,25)
(7,37)-(7,45)
(7,37)-(7,47)
(7,51)-(7,65)
(7,51)-(7,74)
(7,51)-(7,74)
(7,66)-(7,67)
*)
