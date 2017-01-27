
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base x = h ^ x in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,22)
(7,16)-(7,25)
(7,20)-(7,25)
(7,22)-(7,23)
(7,24)-(7,25)
*)

(* type error slice
(3,3)-(7,65)
(6,7)-(7,65)
(6,13)-(6,26)
(6,15)-(6,26)
(6,19)-(6,22)
(6,19)-(6,26)
(6,23)-(6,24)
(6,25)-(6,26)
(7,7)-(7,65)
(7,16)-(7,25)
(7,20)-(7,21)
(7,20)-(7,25)
(7,22)-(7,23)
(7,24)-(7,25)
(7,29)-(7,65)
(7,37)-(7,38)
(7,42)-(7,56)
(7,42)-(7,65)
(7,57)-(7,58)
(7,59)-(7,63)
(7,64)-(7,65)
*)
