
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in
      let base = "" in let l = h ^ t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,6)-(7,63)
(7,23)-(7,63)
(7,31)-(7,32)
(7,31)-(7,36)
(7,33)-(7,34)
*)

(* type error slice
(3,2)-(7,63)
(3,2)-(7,63)
(7,31)-(7,36)
(7,33)-(7,34)
(7,35)-(7,36)
*)
