
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (fun c  -> c l)));;


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
(7,17)-(7,54)
(7,20)-(7,36)
(7,20)-(7,40)
(7,21)-(7,32)
(7,33)-(7,35)
(7,39)-(7,40)
(7,53)-(7,54)
(8,6)-(8,42)
(10,23)-(10,32)
(10,23)-(10,66)
*)

(* type error slice
(2,3)-(8,44)
(2,18)-(8,42)
(6,51)-(6,60)
(6,52)-(6,55)
(6,56)-(6,57)
(10,23)-(10,32)
(10,23)-(10,66)
(10,33)-(10,66)
*)
