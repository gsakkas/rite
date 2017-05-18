
let pipe fs =
  let f a x r s = a in let base r s = 0 in List.fold_left f base fs;;
