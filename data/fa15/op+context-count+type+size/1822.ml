
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  "[" ^ ((List.map (fun t  -> sepConcat "; " l) l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(10,2)-(10,5)
(10,6)-(10,7)
(10,8)-(10,57)
(10,9)-(10,50)
(10,19)-(10,47)
(10,51)-(10,52)
(10,53)-(10,56)
*)

(* type error slice
(10,8)-(10,57)
(10,9)-(10,50)
(10,10)-(10,18)
(10,51)-(10,52)
*)
