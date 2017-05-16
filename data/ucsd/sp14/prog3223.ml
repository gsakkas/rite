
let pipe fs =
  let f a x = let g b y n = match n with | [] -> n | _ -> y b in g a x in
  let base = f 0 [] in List.fold_left f base fs;;
