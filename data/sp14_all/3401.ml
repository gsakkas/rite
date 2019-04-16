
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat ^ (";" ^ ((List.map f l) ^ "]")));;


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
(9,31)-(9,40)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,43)-(9,73)
"]"
LitG

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(9,30)-(9,74)
(9,31)-(9,40)
(9,41)-(9,42)
(9,50)-(9,72)
(9,51)-(9,65)
(9,52)-(9,60)
(9,66)-(9,67)
*)
