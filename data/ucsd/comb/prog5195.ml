
let stringOfList f l =
  match l with | [] -> "[]" | x::[] -> "[" ^ (x ^ "]") | l -> List.map (f, l);;
