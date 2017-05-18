
let rec removeZero l =
  match List.hd l with | 0 -> removeZero List.tl l | _ -> l;;
