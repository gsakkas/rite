
let rec stringOfList f l =
  match l with | [] -> "" | h::t -> h ^ (stringOfList f t);;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
