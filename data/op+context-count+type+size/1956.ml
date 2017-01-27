
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
(6,21)-(6,32)
(6,25)-(6,26)
(6,29)-(6,32)
(7,18)-(7,19)
*)

(* type error slice
(3,3)-(7,59)
(4,11)-(4,13)
(6,7)-(7,59)
(6,13)-(6,32)
(6,15)-(6,32)
(6,17)-(6,32)
(6,21)-(6,32)
(6,25)-(6,26)
(6,25)-(6,32)
(6,27)-(6,28)
(6,29)-(6,32)
(7,7)-(7,59)
(7,18)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
*)
