
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = [] then sep else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,25)-(7,28)
[]
ListG []

*)

(* type error slice
(3,3)-(8,44)
(7,18)-(7,44)
(7,21)-(7,22)
(7,21)-(7,28)
(7,25)-(7,28)
(7,34)-(7,37)
(7,43)-(7,44)
*)
