
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = "" then sep else h in
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
(7,25)-(7,27)
[]
ListG (fromList [])

*)

(* type error slice
(3,3)-(8,44)
(7,21)-(7,22)
(7,21)-(7,27)
(7,25)-(7,27)
*)
