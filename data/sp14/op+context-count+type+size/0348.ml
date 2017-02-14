
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
(6,18)-(6,21)
(7,6)-(7,59)
(7,17)-(7,19)
(7,23)-(7,59)
(7,36)-(7,59)
*)

(* type error slice
(6,6)-(7,59)
(6,12)-(6,21)
(6,14)-(6,21)
(6,18)-(6,19)
(6,18)-(6,21)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
