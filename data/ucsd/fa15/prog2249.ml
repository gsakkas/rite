
let pipe fs =
  let f a x c = a x in let base g x = x in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
