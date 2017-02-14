
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (List.map f l)) ^ "]");;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,56)
(9,41)-(9,55)
*)

(* type error slice
(2,3)-(7,60)
(2,14)-(7,58)
(2,18)-(7,58)
(9,29)-(9,63)
(9,30)-(9,56)
(9,31)-(9,40)
(9,57)-(9,58)
*)
