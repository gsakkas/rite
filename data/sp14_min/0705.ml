
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat "; ") l l;;


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
(9,24)-(9,53)
sepConcat "; " (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(9,24)-(9,32)
(9,24)-(9,53)
*)
