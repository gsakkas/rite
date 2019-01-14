
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with | [] -> "[]" | l -> "[" ^ (sepConcat ";" (List.map f l) "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | l -> "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(10,41)-(10,75)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(10,42)-(10,51)
(^)
VarG

(10,42)-(10,51)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
