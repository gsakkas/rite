
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) [("[", "]")];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) ["["; "]"];;

*)

(* changed spans
(9,65)-(9,77)
["[" ; "]"]
ListG [LitG,LitG]

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,7)-(7,59)
(6,13)-(6,32)
(6,19)-(6,20)
(6,19)-(6,32)
(6,21)-(6,22)
(7,7)-(7,59)
(7,18)-(7,19)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(9,24)-(9,33)
(9,24)-(9,77)
(9,65)-(9,77)
(9,66)-(9,76)
*)
