
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ h in
      let base = h in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ h in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,42)
t
VarG

*)

(* type error slice
(2,4)-(7,71)
(2,19)-(7,69)
(3,3)-(7,69)
(6,19)-(6,22)
(6,19)-(6,26)
(6,23)-(6,24)
(7,31)-(7,40)
(7,31)-(7,42)
(7,41)-(7,42)
*)
