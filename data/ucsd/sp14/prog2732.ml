
let pipe fs =
  let f a x = match a with | [] -> x | _ -> x a in
  let base = [] in List.fold_left f base fs;;
