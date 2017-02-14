
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ sep in
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
(6,21)-(6,22)
*)

(* type error slice
(3,3)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(6,7)-(7,59)
(6,7)-(7,59)
(6,13)-(6,26)
(6,19)-(6,20)
(6,19)-(6,26)
(6,21)-(6,22)
(7,7)-(7,59)
(7,23)-(7,59)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
