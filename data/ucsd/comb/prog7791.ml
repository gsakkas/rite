
let pipe fs = let f a x n = fs in let base n = n in List.fold_left f base fs;;

let _ = pipe [] 3;;
