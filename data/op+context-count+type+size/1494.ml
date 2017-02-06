
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
(3,3)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,7)-(7,59)
(6,13)-(6,72)
(6,15)-(6,72)
(6,23)-(6,34)
(6,23)-(6,37)
(6,23)-(6,37)
(6,35)-(6,37)
(6,48)-(6,49)
(6,53)-(6,56)
(6,59)-(6,60)
(7,7)-(7,59)
(7,18)-(7,19)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(7,58)-(7,59)
(9,4)-(9,73)
(9,18)-(9,70)
(9,20)-(9,70)
(9,32)-(9,41)
(9,32)-(9,61)
(9,43)-(9,47)
(9,43)-(9,61)
(9,43)-(9,61)
(9,49)-(9,57)
(9,49)-(9,61)
(9,49)-(9,61)
(9,49)-(9,61)
(9,58)-(9,59)
(9,60)-(9,61)
*)
