
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (sepConcat (sep, x))) in
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
(6,24)-(6,48)
(6,28)-(6,29)
(6,31)-(6,40)
(6,31)-(6,48)
(6,42)-(6,45)
(6,42)-(6,48)
(6,47)-(6,48)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,31)-(6,40)
(6,31)-(6,48)
(6,42)-(6,45)
(6,42)-(6,48)
*)
