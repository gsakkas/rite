
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,41)
(7,32)-(7,47)
(7,42)-(7,45)
*)

(* type error slice
(2,4)-(7,76)
(2,19)-(7,74)
(2,23)-(7,74)
(3,3)-(7,74)
(3,9)-(3,11)
(4,11)-(4,13)
(6,52)-(6,53)
(6,52)-(6,59)
(6,54)-(6,55)
(6,56)-(6,59)
(7,32)-(7,41)
(7,32)-(7,47)
(7,42)-(7,45)
(7,46)-(7,47)
*)
