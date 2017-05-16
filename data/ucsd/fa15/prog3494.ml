
let pipe fs =
  let f a x a y = a (x y) in let base m = m in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
