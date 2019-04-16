
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,17)-(6,32)
a ^ x
AppG (fromList [VarG])

(7,18)-(7,19)
""
LitG

*)

(* type error slice
(3,3)-(7,59)
(4,11)-(4,13)
(6,7)-(7,59)
(6,13)-(6,32)
(6,15)-(6,32)
(6,17)-(6,32)
(7,7)-(7,59)
(7,23)-(7,59)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
