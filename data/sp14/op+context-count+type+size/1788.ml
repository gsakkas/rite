
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,31)
(6,20)-(6,31)
(6,24)-(6,25)
(6,28)-(6,31)
*)

(* type error slice
(6,6)-(7,59)
(6,12)-(6,31)
(6,14)-(6,31)
(6,16)-(6,31)
(7,6)-(7,59)
(7,17)-(7,19)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
*)
