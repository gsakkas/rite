
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" ^ (sepConcat "; " (List.map f l))) & "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,25)-(9,60)
(9,32)-(9,41)
(9,64)-(9,65)
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
(9,25)-(9,28)
(9,25)-(9,60)
(9,25)-(9,69)
(9,29)-(9,30)
(9,32)-(9,41)
(9,32)-(9,60)
(9,42)-(9,46)
(9,48)-(9,56)
(9,48)-(9,60)
(9,57)-(9,58)
(9,59)-(9,60)
(9,64)-(9,65)
(9,66)-(9,69)
*)
