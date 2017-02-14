
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x h) :: a in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(6,20)-(6,23)
(6,20)-(6,29)
(6,22)-(6,23)
(6,28)-(6,29)
(7,7)-(7,59)
*)

(* type error slice
(3,3)-(7,59)
(3,3)-(7,59)
(6,7)-(7,59)
(6,13)-(6,29)
(6,15)-(6,29)
(6,20)-(6,21)
(6,20)-(6,23)
(6,22)-(6,23)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,58)-(7,59)
*)
