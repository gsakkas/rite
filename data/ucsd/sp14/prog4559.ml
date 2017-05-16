
let rec removeZero l =
  match l with
  | [] -> 1
  | head::tail -> if head = 0 then removeZero tail else head :: tail;;
