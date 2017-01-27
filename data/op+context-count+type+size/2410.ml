
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sepConcat (h ^ (sep t)) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,28)
(6,19)-(6,40)
(6,35)-(6,40)
(6,39)-(6,40)
*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(2,23)-(7,60)
(3,3)-(7,60)
(3,9)-(3,11)
(4,11)-(4,13)
(6,19)-(6,28)
(6,19)-(6,40)
(6,30)-(6,31)
(6,30)-(6,40)
(6,32)-(6,33)
(6,35)-(6,38)
(6,35)-(6,40)
(6,39)-(6,40)
*)
