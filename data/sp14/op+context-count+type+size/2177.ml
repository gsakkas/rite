
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat (sep t))) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,49)
(6,27)-(6,28)
(6,29)-(6,48)
(6,30)-(6,39)
(6,40)-(6,47)
(6,41)-(6,44)
(6,45)-(6,46)
(7,31)-(7,32)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(6,22)-(6,49)
(6,23)-(6,26)
(6,27)-(6,28)
(6,29)-(6,48)
(6,30)-(6,39)
(6,40)-(6,47)
(6,41)-(6,44)
*)
