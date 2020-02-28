
let stringOfList f l = failwith List.map;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "," (List.map f l);;

*)

(* changed spans
(2,24)-(2,41)
sepConcat "," (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,24)-(2,32)
(2,24)-(2,41)
(2,33)-(2,41)
*)
