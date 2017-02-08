
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
(9,24)-(9,32)
(9,24)-(9,70)
(9,33)-(9,41)
(9,43)-(9,67)
(9,63)-(9,65)
(9,66)-(9,67)
(9,69)-(9,70)
*)

(* type error slice
(9,24)-(9,32)
(9,24)-(9,70)
(9,33)-(9,41)
*)
