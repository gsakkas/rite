
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = "" in let l = sl in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,25)
(7,37)-(7,58)
*)

(* type error slice
(3,2)-(7,58)
(4,10)-(4,12)
(6,6)-(7,58)
(7,6)-(7,58)
(7,23)-(7,58)
(7,37)-(7,51)
(7,37)-(7,58)
*)

(* all spans
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,58)
(6,12)-(6,25)
(6,14)-(6,25)
(6,18)-(6,25)
(6,22)-(6,23)
(6,18)-(6,21)
(6,24)-(6,25)
(7,6)-(7,58)
(7,17)-(7,19)
(7,23)-(7,58)
(7,31)-(7,33)
(7,37)-(7,58)
(7,37)-(7,51)
(7,52)-(7,53)
(7,54)-(7,58)
*)
