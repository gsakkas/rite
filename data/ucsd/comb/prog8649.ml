
let pipe fs =
  let f a x = a fs in let base fs = fs in List.fold_left f base fs;;
