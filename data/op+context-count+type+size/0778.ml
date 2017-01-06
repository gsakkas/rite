
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = (List.append "[") ::
  ((sepConcat ";" (List.map f l)) "]");;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;


(* changed spans
(9,24)-(10,5)
(10,33)-(10,39)
*)

(* type error slice
(7,36)-(7,59)
*)
