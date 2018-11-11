
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat List.map (f l) l;;


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
(9,23)-(9,32)
(^)
VarG

(9,23)-(9,32)
(^)
VarG

(9,23)-(9,32)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG [AppG [EmptyG,EmptyG],LitG]

(9,23)-(9,32)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,23)-(9,32)
"["
LitG

(9,23)-(9,49)
"[" ^ (sepConcat ";"
                 (List.map f l) ^ "]")
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,33)-(9,41)
List.map f l
AppG [VarG,VarG]

(9,33)-(9,41)
";"
LitG

(9,48)-(9,49)
"]"
LitG

*)
