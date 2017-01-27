
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun c  -> f l));;


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
(4,11)-(4,13)
(6,23)-(6,34)
(6,23)-(6,37)
(6,35)-(6,37)
(6,53)-(6,56)
(6,53)-(6,60)
(6,57)-(6,58)
(6,59)-(6,60)
(9,24)-(9,33)
(9,24)-(9,62)
(9,34)-(9,37)
(9,39)-(9,47)
(9,39)-(9,62)
(9,49)-(9,62)
*)
