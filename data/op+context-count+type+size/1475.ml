
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (fun c  -> l)));;


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
(7,18)-(7,55)
(7,22)-(7,33)
(7,22)-(7,36)
(7,22)-(7,41)
(7,34)-(7,36)
(7,40)-(7,41)
(7,54)-(7,55)
(8,7)-(8,43)
(10,24)-(10,62)
*)

(* type error slice
(2,4)-(8,45)
(2,19)-(8,43)
(6,53)-(6,56)
(6,53)-(6,60)
(6,57)-(6,58)
(10,24)-(10,33)
(10,24)-(10,62)
(10,35)-(10,62)
*)
