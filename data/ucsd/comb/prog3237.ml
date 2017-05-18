
let pipe fs =
  let f a x = match x with | [] -> a | _ -> x a in
  let base = 0 in List.fold_left f base fs;;
