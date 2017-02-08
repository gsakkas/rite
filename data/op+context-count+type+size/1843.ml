
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";") ^ ((List.map (f l)) ^ "]"));;


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
(9,32)-(9,45)
(9,51)-(9,64)
(9,61)-(9,64)
(9,67)-(9,68)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(9,32)-(9,41)
(9,32)-(9,45)
(9,32)-(9,72)
(9,47)-(9,48)
(9,51)-(9,59)
(9,51)-(9,64)
(9,51)-(9,72)
(9,67)-(9,68)
*)
