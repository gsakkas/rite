
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
(10,42)-(10,76)
sepConcat ";" (List.map f
                        l) ^ "]"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(10,42)-(10,76)
(10,43)-(10,52)
*)
