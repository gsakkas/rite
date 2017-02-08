
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; ", (List.map f l))) ^ "]");;


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
(9,32)-(9,62)
(9,43)-(9,62)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,53)-(6,56)
(6,53)-(6,60)
(6,57)-(6,58)
(9,32)-(9,41)
(9,32)-(9,62)
(9,43)-(9,62)
*)
