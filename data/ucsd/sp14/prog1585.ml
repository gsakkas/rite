
let pipe fs =
  let f a x = function | _ -> x a in let base = 0 in List.fold_left f base fs;;
