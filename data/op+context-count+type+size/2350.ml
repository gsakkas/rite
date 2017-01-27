
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
(3,9)-(3,11)
(4,11)-(4,13)
(6,24)-(6,33)
(6,24)-(6,37)
(6,34)-(6,35)
(6,36)-(6,37)
(7,18)-(7,19)
(7,18)-(7,25)
(7,20)-(7,21)
(7,22)-(7,25)
*)
