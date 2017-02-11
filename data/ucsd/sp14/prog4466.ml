
let stringOfList f l =
  match l with
  | [] -> "]"
  | h::t ->
      let m a b = "[" ^ (a ^ (";" ^ (b ^ "]"))) in
      let base = f h in List.fold_left m base t;;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
