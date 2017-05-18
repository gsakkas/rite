
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h curr) tl in
  iter (fun y  -> y) fs;;
