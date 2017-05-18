
let pipe fs =
  let f a x c d = x d in let base b = b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
