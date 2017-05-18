
let pipe fs =
  let f a x fs = x a in let base fs = fs in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
