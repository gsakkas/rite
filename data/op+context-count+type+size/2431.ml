
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,49)-(6,50)
*)

(* type error slice
(2,4)-(6,79)
(2,19)-(6,77)
(2,23)-(6,77)
(3,3)-(6,77)
(3,3)-(6,77)
(3,3)-(6,77)
(3,3)-(6,77)
(3,3)-(6,77)
(3,9)-(3,11)
(6,7)-(6,77)
(6,13)-(6,20)
(6,15)-(6,20)
(6,19)-(6,20)
(6,41)-(6,77)
(6,49)-(6,50)
(6,54)-(6,68)
(6,54)-(6,77)
(6,54)-(6,77)
(6,54)-(6,77)
(6,69)-(6,70)
(6,76)-(6,77)
*)
