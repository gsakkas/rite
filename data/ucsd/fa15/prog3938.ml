
let pipe fs = let f a x x a = a in let base f = f in List.fold_left f base fs;;

let _ = pipe [] 3;;
