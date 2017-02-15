
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,34)
(6,32)-(6,33)
(7,30)-(7,32)
*)

(* type error slice
(6,6)-(7,59)
(6,12)-(6,35)
(6,14)-(6,35)
(6,18)-(6,35)
(6,20)-(6,21)
(6,29)-(6,34)
(6,30)-(6,31)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
