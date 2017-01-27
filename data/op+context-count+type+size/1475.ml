
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; " (List.map f l))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,32)-(9,61)
(9,43)-(9,61)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(6,23)-(6,34)
(6,23)-(6,37)
(6,35)-(6,37)
(6,53)-(6,56)
(6,53)-(6,60)
(6,57)-(6,58)
(6,59)-(6,60)
(9,32)-(9,41)
(9,32)-(9,61)
(9,32)-(9,70)
(9,43)-(9,47)
(9,43)-(9,61)
(9,49)-(9,57)
(9,49)-(9,61)
(9,58)-(9,59)
(9,60)-(9,61)
(9,65)-(9,66)
(9,67)-(9,70)
*)
