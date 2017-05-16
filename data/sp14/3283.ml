
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat f l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let nl = List.map f l in sepConcat "" nl;;

*)

(* changed spans
(11,23)-(11,31)
(11,23)-(11,45)
(11,32)-(11,41)
*)

(* type error slice
(11,23)-(11,31)
(11,23)-(11,45)
*)

(* all spans
(2,6)-(2,15)
(2,10)-(2,15)
(2,10)-(2,11)
(2,14)-(2,15)
(4,18)-(9,58)
(4,22)-(9,58)
(5,2)-(9,58)
(5,8)-(5,10)
(6,10)-(6,12)
(8,6)-(9,58)
(8,12)-(8,31)
(8,14)-(8,31)
(8,18)-(8,31)
(8,20)-(8,21)
(8,18)-(8,19)
(8,22)-(8,31)
(8,27)-(8,28)
(8,23)-(8,26)
(8,29)-(8,30)
(9,6)-(9,58)
(9,17)-(9,18)
(9,22)-(9,58)
(9,30)-(9,31)
(9,35)-(9,58)
(9,35)-(9,49)
(9,50)-(9,51)
(9,52)-(9,56)
(9,57)-(9,58)
(11,17)-(11,45)
(11,19)-(11,45)
(11,23)-(11,45)
(11,23)-(11,31)
(11,32)-(11,41)
(11,42)-(11,43)
(11,44)-(11,45)
*)
