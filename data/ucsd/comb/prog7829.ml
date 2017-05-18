
let rec removeZero l =
  match l with | [] -> [] | 0 -> hd :: (t removeZero t) | _ -> l;;
