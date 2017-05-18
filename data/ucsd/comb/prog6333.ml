
let pipe fs =
  let f a x n = n (a x) in let base n = 0 in List.fold_left f base fs;;

let _ = pipe [] 3;;
