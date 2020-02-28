
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep :: (sepConcat (sep t))) in
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
(6,23)-(6,51)
sep
VarG

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(6,19)-(6,51)
(6,21)-(6,22)
(6,23)-(6,51)
(6,31)-(6,50)
(6,32)-(6,41)
(6,42)-(6,49)
(6,43)-(6,46)
*)
