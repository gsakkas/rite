
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


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
(2,31)-(2,45)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,30)-(2,52)
(2,31)-(2,45)
(2,32)-(2,40)
(2,46)-(2,47)
*)
