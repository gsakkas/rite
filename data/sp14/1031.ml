
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = List.append (List.append a sep) h in
      let base = t in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,29)
(6,30)-(6,49)
(6,31)-(6,42)
(6,50)-(6,51)
(7,17)-(7,18)
(7,30)-(7,32)
*)

(* type error slice
(3,2)-(7,59)
(3,2)-(7,59)
(6,6)-(7,59)
(6,12)-(6,51)
(6,18)-(6,29)
(6,18)-(6,51)
(6,30)-(6,49)
(6,31)-(6,42)
(6,43)-(6,44)
(6,50)-(6,51)
(7,6)-(7,59)
(7,17)-(7,18)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
*)

(* all spans
(2,18)-(7,59)
(2,22)-(7,59)
(3,2)-(7,59)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,59)
(6,12)-(6,51)
(6,14)-(6,51)
(6,18)-(6,51)
(6,18)-(6,29)
(6,30)-(6,49)
(6,31)-(6,42)
(6,43)-(6,44)
(6,45)-(6,48)
(6,50)-(6,51)
(7,6)-(7,59)
(7,17)-(7,18)
(7,22)-(7,59)
(7,30)-(7,32)
(7,36)-(7,59)
(7,36)-(7,50)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
*)
