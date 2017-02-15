
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (List.map "[") ^ ((sepConcat l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" (List.map f l);;

*)

(* changed spans
(9,23)-(9,37)
(9,24)-(9,32)
(9,33)-(9,36)
(9,38)-(9,39)
(9,40)-(9,61)
(9,41)-(9,54)
(9,52)-(9,53)
(9,55)-(9,56)
(9,57)-(9,60)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(9,23)-(9,37)
(9,24)-(9,32)
(9,33)-(9,36)
(9,40)-(9,61)
(9,41)-(9,54)
(9,42)-(9,51)
(9,55)-(9,56)
*)
