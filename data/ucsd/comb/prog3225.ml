
let pipe fs =
  let f a x = match x with | [] -> 1 | _ -> x a in
  let base = f 0 [] in List.fold_left f base fs;;
