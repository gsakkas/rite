
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  "[" ^ ((List.map (fun t  -> sepConcat "; " l) l) ^ "]");;


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
(10,2)-(10,5)
(10,6)-(10,7)
(10,8)-(10,57)
(10,9)-(10,50)
(10,19)-(10,47)
(10,51)-(10,52)
(10,53)-(10,56)
*)

(* type error slice
(10,8)-(10,57)
(10,9)-(10,50)
(10,10)-(10,18)
(10,51)-(10,52)
*)

(* all spans
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,58)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(7,58)
(7,17)-(7,18)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,58)
(7,35)-(7,49)
(7,50)-(7,51)
(7,52)-(7,56)
(7,57)-(7,58)
(9,17)-(10,57)
(9,19)-(10,57)
(10,2)-(10,57)
(10,6)-(10,7)
(10,2)-(10,5)
(10,8)-(10,57)
(10,51)-(10,52)
(10,9)-(10,50)
(10,10)-(10,18)
(10,19)-(10,47)
(10,30)-(10,46)
(10,30)-(10,39)
(10,40)-(10,44)
(10,45)-(10,46)
(10,48)-(10,49)
(10,53)-(10,56)
*)
