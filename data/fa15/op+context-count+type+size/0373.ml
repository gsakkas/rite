
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
(10,37)-(10,60)
(10,52)-(10,60)
*)

(* type error slice
(2,3)-(7,60)
(2,14)-(7,58)
(2,18)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(6,6)-(7,58)
(6,12)-(6,31)
(6,18)-(6,19)
(6,18)-(6,31)
(6,20)-(6,21)
(7,6)-(7,58)
(7,17)-(7,18)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,52)-(7,56)
(10,2)-(10,11)
(10,2)-(10,64)
(10,16)-(10,64)
(10,17)-(10,25)
(10,26)-(10,61)
(10,37)-(10,60)
(10,52)-(10,60)
(10,52)-(10,60)
(10,57)-(10,60)
*)
