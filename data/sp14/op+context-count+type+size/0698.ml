
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
(7,24)-(7,26)
*)

(* type error slice
(3,2)-(8,43)
(3,2)-(8,43)
(7,20)-(7,21)
(7,20)-(7,26)
(7,20)-(7,26)
(7,24)-(7,26)
*)
