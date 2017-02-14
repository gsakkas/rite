
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else t in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else h in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,41)-(7,42)
*)

(* type error slice
(3,2)-(8,43)
(3,2)-(8,43)
(7,17)-(7,42)
(7,17)-(7,42)
(7,32)-(7,35)
(7,41)-(7,42)
*)
