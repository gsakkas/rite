
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (f l)) ^ ((sepConcat (";" l)) ^ "]"));;


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
(9,30)-(9,46)
(9,31)-(9,39)
(9,40)-(9,45)
(9,49)-(9,76)
(9,50)-(9,69)
(9,51)-(9,60)
(9,61)-(9,68)
(9,70)-(9,71)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(9,29)-(9,77)
(9,30)-(9,46)
(9,31)-(9,39)
(9,47)-(9,48)
(9,49)-(9,76)
(9,50)-(9,69)
(9,51)-(9,60)
(9,61)-(9,68)
(9,62)-(9,65)
(9,70)-(9,71)
*)
