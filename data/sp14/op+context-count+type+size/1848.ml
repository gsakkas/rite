
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat ("" l)) l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,24)-(9,32)
(9,34)-(9,43)
(9,34)-(9,49)
(9,45)-(9,47)
(9,45)-(9,49)
(9,48)-(9,49)
(9,52)-(9,53)
*)

(* type error slice
(9,45)-(9,47)
(9,45)-(9,49)
*)
