
let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = "[" ^ (f x) in (List.fold_left g base xs) ^ "]";;

let stringOfList f l = "[" ^ ((stringOfList (List.map f l)) ^ "]");;
