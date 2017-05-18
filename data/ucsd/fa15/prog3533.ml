
let pipe fs =
  let f a x = (fun result  -> fun x  -> a + x) 0 in
  let base = 1 in List.fold_left f base fs;;
