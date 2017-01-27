
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat ^ (";" ^ ((List.map f l) ^ "]")));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,31)-(9,40)
(9,48)-(9,49)
(9,52)-(9,64)
(9,66)-(9,67)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(4,11)-(4,13)
(6,24)-(6,27)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
(9,31)-(9,40)
(9,31)-(9,71)
(9,41)-(9,42)
(9,44)-(9,47)
(9,44)-(9,71)
(9,48)-(9,49)
(9,52)-(9,60)
(9,52)-(9,64)
(9,52)-(9,71)
(9,61)-(9,62)
(9,63)-(9,64)
(9,66)-(9,67)
(9,68)-(9,71)
*)
