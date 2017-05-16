
let pipe fs =
  let f a x x a = fs in let base fs = fs in List.fold_left f base fs;;

let _ = pipe [] 3;;
