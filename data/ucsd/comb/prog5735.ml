
let pipe fs =
  let f a x b = x + b in let base b = b in List.fold_left f base fs;;

let pipe fs =
  let f a x b = pipe b in let base b = b in List.fold_left f base fs;;
