
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (sepConcat h) ^ (sep t) in
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
(6,20)-(6,29)
(6,20)-(6,31)
(6,36)-(6,41)
(6,40)-(6,41)
*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(3,3)-(7,60)
(3,3)-(7,60)
(6,20)-(6,29)
(6,20)-(6,31)
(6,30)-(6,31)
(6,36)-(6,39)
(6,36)-(6,41)
(6,40)-(6,41)
*)
