
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat ";" (List.map (fun t  -> let g = f t in g :: "]") l);;


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
(10,38)-(10,61)
f t
AppG [VarG]

*)

(* type error slice
(2,4)-(7,61)
(2,15)-(7,59)
(2,19)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,7)-(7,59)
(6,13)-(6,32)
(6,19)-(6,20)
(6,19)-(6,32)
(6,21)-(6,22)
(7,7)-(7,59)
(7,18)-(7,19)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(10,3)-(10,12)
(10,3)-(10,65)
(10,17)-(10,65)
(10,18)-(10,26)
(10,27)-(10,62)
(10,38)-(10,61)
(10,53)-(10,61)
(10,58)-(10,61)
*)
