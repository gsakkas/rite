
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
(6,20)-(6,28)
(6,20)-(6,30)
(7,18)-(7,21)
(7,25)-(7,62)
*)

(* type error slice
(6,20)-(6,28)
(6,20)-(6,30)
(6,20)-(6,35)
(6,32)-(6,33)
*)
