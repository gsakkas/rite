
let stringOfList f l =
  match l with
  | [] -> "]"
  | h::t ->
      let f' a x = a ^ (";" ^ (f x)) in
      let base = h in let l = t in "[" ^ (List.fold_left f' base l);;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
