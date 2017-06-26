
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
(7,24)-(7,27)
(7,42)-(7,49)
(7,44)-(7,45)
(7,46)-(7,49)
*)

(* type error slice
(3,2)-(8,43)
(7,17)-(7,49)
(7,20)-(7,21)
(7,20)-(7,27)
(7,24)-(7,27)
(7,33)-(7,36)
(7,42)-(7,49)
(7,44)-(7,45)
(7,46)-(7,49)
*)

(* all spans
(2,18)-(8,43)
(2,22)-(8,43)
(3,2)-(8,43)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(8,43)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(8,43)
(7,17)-(7,49)
(7,20)-(7,27)
(7,20)-(7,21)
(7,24)-(7,27)
(7,33)-(7,36)
(7,42)-(7,49)
(7,44)-(7,45)
(7,42)-(7,43)
(7,46)-(7,49)
(8,6)-(8,43)
(8,14)-(8,16)
(8,20)-(8,43)
(8,20)-(8,34)
(8,35)-(8,36)
(8,37)-(8,41)
(8,42)-(8,43)
*)
