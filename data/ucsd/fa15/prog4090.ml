
let pipe fs =
  let f a x f' d = x (a d) in let base c = c in List.fold_left f base fs;;
