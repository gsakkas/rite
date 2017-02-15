
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
(7,24)-(7,27)
*)

(* type error slice
(3,2)-(8,43)
(3,2)-(8,43)
(7,17)-(7,43)
(7,17)-(7,43)
(7,20)-(7,21)
(7,20)-(7,27)
(7,20)-(7,27)
(7,24)-(7,27)
(7,33)-(7,36)
(7,42)-(7,43)
*)
