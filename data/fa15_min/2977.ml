
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = [t] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,48)-(6,51)
t
VarG

*)

(* type error slice
(3,3)-(6,78)
(6,7)-(6,78)
(6,13)-(6,20)
(6,15)-(6,20)
(6,19)-(6,20)
(6,24)-(6,78)
(6,35)-(6,36)
(6,40)-(6,78)
(6,48)-(6,51)
(6,49)-(6,50)
(6,55)-(6,69)
(6,55)-(6,78)
(6,70)-(6,71)
(6,72)-(6,76)
(6,77)-(6,78)
*)
