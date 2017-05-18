
let identity a = a;;

let pipe fs =
  let f a x = a x in let base = identity in List.fold_left f base fs;;
