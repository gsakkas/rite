
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sepConcat sep t) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,26)
sepConcat sep t
AppG [VarG,VarG]

(7,31)-(7,46)
t
VarG

*)

(* type error slice
(2,4)-(7,75)
(2,19)-(7,73)
(2,23)-(7,73)
(3,3)-(7,73)
(4,11)-(4,13)
(7,23)-(7,73)
(7,31)-(7,40)
(7,31)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,72)-(7,73)
*)
