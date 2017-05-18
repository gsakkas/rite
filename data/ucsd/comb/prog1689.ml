
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h acc) tl in
  iter (fun y  -> y) fs;;

let _ = pipe [(fun x  -> x + 3); (fun x  -> x + x)] 3;;
