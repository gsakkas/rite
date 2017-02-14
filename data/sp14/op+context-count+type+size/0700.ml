
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h ^ sep in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = [] then sep else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,25)-(7,28)
(7,43)-(7,50)
(7,45)-(7,46)
(7,47)-(7,50)
*)

(* type error slice
(3,3)-(8,44)
(3,3)-(8,44)
(6,7)-(8,44)
(6,13)-(6,24)
(6,19)-(6,20)
(6,19)-(6,24)
(6,21)-(6,22)
(7,7)-(8,44)
(7,18)-(7,50)
(7,21)-(7,22)
(7,21)-(7,28)
(7,21)-(7,28)
(7,25)-(7,28)
(7,34)-(7,37)
(7,43)-(7,50)
(7,45)-(7,46)
(7,47)-(7,50)
(8,21)-(8,35)
(8,21)-(8,44)
(8,36)-(8,37)
(8,38)-(8,42)
*)
