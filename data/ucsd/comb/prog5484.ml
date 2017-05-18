
let pipe fs =
  let f a x = match fs with | x::y -> x in
  let base = f [] in List.fold_left f base fs;;
