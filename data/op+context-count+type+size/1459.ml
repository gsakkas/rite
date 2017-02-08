
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) = 2 then a ^ x in
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
(6,19)-(6,52)
(6,23)-(6,41)
(7,7)-(7,61)
(7,38)-(7,52)
(7,53)-(7,54)
(7,55)-(7,59)
(7,60)-(7,61)
*)

(* type error slice
(6,19)-(6,52)
(6,19)-(6,52)
(6,19)-(6,52)
(6,47)-(6,52)
(6,49)-(6,50)
*)
