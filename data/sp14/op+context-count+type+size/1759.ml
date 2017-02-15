
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ h in
      let base = h in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ h in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,39)
(7,30)-(7,41)
*)

(* type error slice
(2,3)-(7,70)
(2,18)-(7,68)
(3,2)-(7,68)
(3,2)-(7,68)
(6,18)-(6,21)
(6,18)-(6,25)
(6,22)-(6,23)
(7,30)-(7,39)
(7,30)-(7,41)
(7,40)-(7,41)
*)
