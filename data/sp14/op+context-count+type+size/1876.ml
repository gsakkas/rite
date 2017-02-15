
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (a ^ sep) x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,29)
(6,28)-(6,29)
*)

(* type error slice
(6,18)-(6,27)
(6,18)-(6,29)
(6,21)-(6,22)
*)
