
let pipe fs =
  let f a x a = x a in let base d b = d b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
