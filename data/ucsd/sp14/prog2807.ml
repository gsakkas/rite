
let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let f a x = a ^ ("; " ^ x) in let base = x in List.fold_left f base xs;;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
