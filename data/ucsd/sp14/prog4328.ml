
let pipe fs =
  let f a x = List.rev x in let base p = p in List.fold_left f base fs;;
