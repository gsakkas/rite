
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(9,40)-(9,50)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,7)-(7,59)
(6,13)-(6,31)
(6,15)-(6,31)
(6,19)-(6,20)
(6,24)-(6,27)
(6,30)-(6,31)
(7,7)-(7,59)
(7,18)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
(9,4)-(9,53)
(9,18)-(9,50)
(9,20)-(9,50)
(9,24)-(9,33)
(9,24)-(9,50)
(9,24)-(9,50)
(9,40)-(9,48)
(9,40)-(9,50)
(9,40)-(9,50)
(9,49)-(9,50)
*)
