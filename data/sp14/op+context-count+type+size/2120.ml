
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev x) ^ a in
      let base = sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,30)
(6,19)-(6,27)
(7,17)-(7,20)
(7,24)-(7,61)
*)

(* type error slice
(6,18)-(6,30)
(6,18)-(6,34)
(6,19)-(6,27)
(6,31)-(6,32)
*)
