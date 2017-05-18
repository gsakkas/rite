
let pipe fs =
  let f a x g = (x a) g in let base g = g in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
