
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" sepConcat "" (List.map f l)) ^ "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat " " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,25)-(9,55)
(9,29)-(9,38)
(9,39)-(9,41)
*)

(* type error slice
(9,25)-(9,28)
(9,25)-(9,55)
*)
