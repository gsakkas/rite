
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = failwith List.map (fun x  -> sepConcat "" x) l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "," (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
(9,23)-(9,69)
(9,32)-(9,40)
(9,41)-(9,67)
(9,62)-(9,64)
(9,65)-(9,66)
(9,68)-(9,69)
*)

(* type error slice
(9,23)-(9,31)
(9,23)-(9,69)
(9,32)-(9,40)
*)
