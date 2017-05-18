
let stringOfList f l = "[" ^ ((List.fold_left f "" l) ^ "]");;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
