
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
(9,64)-(9,76)
(9,65)-(9,75)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(6,6)-(7,58)
(6,12)-(6,31)
(6,18)-(6,19)
(6,18)-(6,31)
(6,20)-(6,21)
(7,6)-(7,58)
(7,17)-(7,18)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,52)-(7,56)
(9,23)-(9,32)
(9,23)-(9,76)
(9,64)-(9,76)
(9,64)-(9,76)
(9,65)-(9,75)
*)
