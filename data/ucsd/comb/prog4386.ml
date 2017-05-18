
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let g a x = a ^ ("; " ^ x) in
      let base = f h in let l = t in List.fold_left g base l;;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
