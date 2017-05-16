
let pipe fs =
  let f a x = let existing = a in let next = x in existing next in
  let base x = x in List.fold_left f base fs;;
