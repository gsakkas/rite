
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = sepConcat (sep t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,49)
t
VarG

*)

(* type error slice
(2,4)-(7,78)
(2,19)-(7,76)
(2,23)-(7,76)
(6,19)-(6,26)
(6,21)-(6,22)
(6,23)-(6,26)
(7,24)-(7,76)
(7,32)-(7,41)
(7,32)-(7,49)
(7,42)-(7,49)
(7,43)-(7,46)
(7,53)-(7,67)
(7,53)-(7,76)
(7,75)-(7,76)
*)
