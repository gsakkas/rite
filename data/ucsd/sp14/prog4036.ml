
let pipe fs =
  let f a x g b y z = match y with | [] -> z | _ -> b a in
  let base = f 0 [] in List.fold_left f base fs;;
