
let stringOfList f l = "[" ^ ((List.map f l) ^ "]");;


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
(3,1)-(3,1)
fun f ->
  fun l ->
    match l with
    | [] -> "[]"
    | x :: xs -> (let g =
                    fun a ->
                      fun x -> a ^ ("; " ^ f x) in
                  let base = "[" ^ f x in
                  List.fold_left g base
                                 xs ^ "]")
LamG VarPatG (LamG EmptyPatG EmptyG)

(2,31)-(2,45)
stringOfList f (List.map f l)
AppG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,30)-(2,52)
(2,31)-(2,45)
(2,32)-(2,40)
(2,46)-(2,47)
*)
