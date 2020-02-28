
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> ((f t) ^ "]") l));;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> f t) l);;

*)

(* changed spans
(9,38)-(9,76)
List.map (fun t -> f t) l
AppG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(2,4)-(7,61)
(2,15)-(7,59)
(2,19)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(9,24)-(9,33)
(9,24)-(9,76)
(9,38)-(9,76)
(9,39)-(9,47)
(9,59)-(9,72)
(9,59)-(9,74)
(9,66)-(9,67)
*)
