
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if List.length < 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,48)
(6,22)-(6,33)
(6,36)-(6,37)
(7,7)-(7,61)
(7,32)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
(7,55)-(7,59)
(7,60)-(7,61)
*)

(* type error slice
(6,19)-(6,48)
(6,22)-(6,33)
(6,22)-(6,37)
(6,36)-(6,37)
(6,43)-(6,44)
(6,43)-(6,48)
(6,45)-(6,46)
(6,47)-(6,48)
*)
