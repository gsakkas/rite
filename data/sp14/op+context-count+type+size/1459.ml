
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
(6,18)-(6,51)
(6,21)-(6,40)
(7,6)-(7,60)
(7,37)-(7,51)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
*)

(* type error slice
(6,18)-(6,51)
(6,18)-(6,51)
(6,18)-(6,51)
(6,46)-(6,51)
(6,48)-(6,49)
*)
