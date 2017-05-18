
let pipe fs =
  let f a x = a + (x fs) in let base fs = fs in List.fold_left f base fs;;
