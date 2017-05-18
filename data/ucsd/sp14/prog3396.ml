
let pipe fs =
  match fs with
  | [] -> 0
  | f::fs' -> let f a x = x a in let base = f 0 in List.fold_left f base fs;;
