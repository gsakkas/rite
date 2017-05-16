
let pipe fs =
  let f a x = a x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;
