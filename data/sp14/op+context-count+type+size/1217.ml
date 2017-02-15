
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
      let base = t in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(7,17)-(7,18)
(7,22)-(7,58)
(7,35)-(7,58)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(6,6)-(7,58)
(6,6)-(7,58)
(6,12)-(6,25)
(6,18)-(6,19)
(6,18)-(6,25)
(6,20)-(6,21)
(7,6)-(7,58)
(7,22)-(7,58)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
*)
