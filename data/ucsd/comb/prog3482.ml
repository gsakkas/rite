
let pipe fs = let f a x = x a in let base = 0 + 0 in List.fold_left f base fs;;

let _ = pipe [] 3;;
