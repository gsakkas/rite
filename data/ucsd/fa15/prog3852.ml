
let pipe fs = let f a x = fs in let base = fs in List.fold_left f base fs;;

let _ = pipe [] 3;;
