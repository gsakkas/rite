
let stringOfList f l = match l with | [] -> "[]" | x::[] -> "[" ^ (x ^ "]");;

let _ =
  stringOfList (stringOfList string_of_int) [[1; 2; 3]; [4; 5]; [6]; []];;
