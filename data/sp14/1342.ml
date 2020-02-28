
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,20)
sepConcat sep t
AppG [VarG,VarG]

(7,32)-(7,47)
t
VarG

*)

(* type error slice
(2,4)-(7,76)
(2,19)-(7,74)
(2,23)-(7,74)
(3,3)-(7,74)
(4,11)-(4,13)
(7,24)-(7,74)
(7,32)-(7,41)
(7,32)-(7,47)
(7,51)-(7,65)
(7,51)-(7,74)
(7,73)-(7,74)
*)
