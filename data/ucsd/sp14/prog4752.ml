
let pipe fs =
  let f a x a x =
    match x with | (x',y) -> (match x' with | [] -> y | _ -> x' a) in
  let base = f 0 [] in List.fold_left f base fs;;
