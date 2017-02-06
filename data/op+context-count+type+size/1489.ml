
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun f  -> f l));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,39)-(9,62)
(9,49)-(9,62)
(9,59)-(9,62)
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
(9,4)-(9,66)
(9,18)-(9,62)
(9,20)-(9,62)
(9,24)-(9,33)
(9,24)-(9,62)
(9,24)-(9,62)
(9,39)-(9,47)
(9,39)-(9,62)
(9,39)-(9,62)
(9,49)-(9,62)
(9,59)-(9,60)
(9,59)-(9,62)
(9,59)-(9,62)
(9,61)-(9,62)
*)
