
let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = "[" ^ (f x) in (List.fold_left g base xs) ^ "]";;

let stringOfList f l = "[" ^ ((stringOfList (List.map f l)) ^ "]");;


(* fix

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = "[" ^ (f x) in (List.fold_left g base xs) ^ "]";;

let stringOfList f l = "[" ^ ((stringOfList f (List.map f l)) ^ "]");;

*)

(* changed spans
(9,32)-(9,58)
(9,46)-(9,58)
*)

(* type error slice
(2,4)-(7,67)
(2,18)-(7,65)
(2,20)-(7,65)
(3,3)-(7,65)
(3,9)-(3,10)
(4,11)-(4,15)
(6,32)-(6,33)
(6,32)-(6,35)
(6,34)-(6,35)
(9,32)-(9,44)
(9,32)-(9,58)
(9,46)-(9,54)
(9,46)-(9,58)
(9,55)-(9,56)
(9,57)-(9,58)
*)
