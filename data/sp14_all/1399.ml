
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
(6,25)-(6,26)
a
VarG

(7,38)-(7,59)
List.fold_left f base l
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(7,59)
(4,11)-(4,13)
(6,7)-(7,59)
(7,7)-(7,59)
(7,24)-(7,59)
(7,38)-(7,52)
(7,38)-(7,59)
*)
