
let stringOfList f l =
  let f' a x = a ^ x in let base = "]" in List.fold_right f' l base;;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
