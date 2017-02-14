
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (List.append "[") ::
  ((sepConcat ";" (List.map f l)) "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,23)-(9,40)
(9,23)-(10,38)
(9,24)-(9,35)
(9,36)-(9,39)
(10,2)-(10,38)
(10,34)-(10,37)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(9,23)-(9,40)
(9,24)-(9,35)
(9,36)-(9,39)
(10,2)-(10,38)
(10,3)-(10,33)
(10,4)-(10,13)
*)
