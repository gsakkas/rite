
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = sepConcat (sep t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,48)
(7,41)-(7,48)
(7,42)-(7,45)
*)

(* type error slice
(2,3)-(7,77)
(2,18)-(7,75)
(2,22)-(7,75)
(6,18)-(6,25)
(6,20)-(6,21)
(6,22)-(6,25)
(7,23)-(7,75)
(7,31)-(7,40)
(7,31)-(7,48)
(7,41)-(7,48)
(7,42)-(7,45)
(7,52)-(7,66)
(7,52)-(7,75)
(7,74)-(7,75)
*)
