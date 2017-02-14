
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = t :: h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = h :: t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,33)
(7,37)-(7,38)
(7,42)-(7,65)
*)

(* type error slice
(3,3)-(7,65)
(3,3)-(7,65)
(7,32)-(7,33)
(7,32)-(7,38)
(7,32)-(7,38)
(7,37)-(7,38)
*)
