
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
(6,19)-(6,42)
h ^ sep
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(6,19)-(6,28)
(6,19)-(6,42)
(6,29)-(6,42)
(6,32)-(6,33)
(6,34)-(6,41)
(6,35)-(6,38)
*)
