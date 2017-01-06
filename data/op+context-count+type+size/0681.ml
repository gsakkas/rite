
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";") ^ ([List.map (f l)] ^ "]"));;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;


(* changed spans
(7,31)-(7,33)
(9,45)-(9,48)
(9,50)-(9,51)
(9,60)-(9,61)
(9,65)-(9,66)
(9,73)-(9,74)
*)

(* type error slice
(7,37)-(7,60)
*)
