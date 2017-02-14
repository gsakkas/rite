
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
(9,25)-(9,36)
(9,25)-(9,40)
(9,25)-(10,38)
(9,37)-(9,40)
(10,5)-(10,38)
(10,35)-(10,38)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(9,25)-(9,36)
(9,25)-(9,40)
(9,37)-(9,40)
(10,5)-(10,14)
(10,5)-(10,32)
(10,5)-(10,38)
*)
