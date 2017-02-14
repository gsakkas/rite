
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
(7,18)-(7,20)
(7,24)-(7,73)
(7,37)-(7,45)
(7,44)-(7,45)
*)

(* type error slice
(7,32)-(7,45)
(7,34)-(7,35)
(7,37)-(7,45)
*)
