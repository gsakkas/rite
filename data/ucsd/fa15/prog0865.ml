
let rec stringOfList f l =
  match l with | [] -> 0 | h::t -> h + (stringOfList f t);;

let stringOfList f l =
  match l with | [] -> 0 | h::t -> h + (stringOfList f t);;

let stringOfList f l =
  match l with | [] -> "" | h::t -> (string_of_int h) ^ (stringOfList f t);;
