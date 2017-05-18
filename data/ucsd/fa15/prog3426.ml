
let pipe fs =
  let f a x a x = a x in let base b = b in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 4;;
