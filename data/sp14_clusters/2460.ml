
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat "" l);;


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
(9,32)-(9,33)
(^)
VarG

(9,34)-(9,50)
"["
LitG

(9,35)-(9,44)
(^)
VarG

(9,35)-(9,44)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,45)-(9,47)
";"
LitG

(9,48)-(9,49)
List.map
VarG

(9,48)-(9,49)
f
VarG

(9,48)-(9,49)
List.map f l
AppG [VarG,VarG]

*)
