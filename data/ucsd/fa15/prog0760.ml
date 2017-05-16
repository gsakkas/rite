
let pipe fs =
  let f a x y = x a y in let base x' = x' in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
