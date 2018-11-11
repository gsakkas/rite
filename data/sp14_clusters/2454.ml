
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map ((sepConcat "") l) l;;


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
(9,33)-(9,47)
(^)
VarG

(9,34)-(9,43)
(^)
VarG

(9,34)-(9,43)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG [AppG [EmptyG,EmptyG],LitG]

(9,34)-(9,43)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,34)-(9,43)
"["
LitG

(9,48)-(9,49)
";"
LitG

(9,51)-(9,52)
List.map
VarG

(9,51)-(9,52)
f
VarG

(9,51)-(9,52)
List.map f l
AppG [VarG,VarG]

*)
