
let y x = x + 1;;

let q x = y x;;

let pipe fs =
  let f a x el = x (a q) in let base g q = q in List.fold_left f base fs;;

let _ = pipe [] 3;;
