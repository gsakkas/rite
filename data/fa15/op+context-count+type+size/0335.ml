
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = h ^ (sep :: t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h ^ sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
(7,23)-(7,72)
(7,35)-(7,45)
(7,43)-(7,44)
*)

(* type error slice
(7,31)-(7,45)
(7,33)-(7,34)
(7,35)-(7,45)
*)
