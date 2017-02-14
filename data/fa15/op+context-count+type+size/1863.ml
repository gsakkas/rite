
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in let base = h in let l = t in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,23)
(6,27)-(6,77)
(6,43)-(6,77)
(6,56)-(6,77)
*)

(* type error slice
(3,2)-(6,77)
(3,2)-(6,77)
(4,10)-(4,12)
(6,6)-(6,77)
(6,27)-(6,77)
(6,43)-(6,77)
(6,56)-(6,70)
(6,56)-(6,77)
*)
