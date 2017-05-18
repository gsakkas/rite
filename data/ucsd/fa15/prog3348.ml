
let pipe fs =
  let f a x g = x (a g) in let base = [] in List.fold_left f base fs;;
