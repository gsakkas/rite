
let identity a = a;;

let pipe fs =
  let f a x x = x a in let base = identity in List.fold_left f base fs;;
