
let rec reverseHelper l m =
  match l with | x::s -> (reverseHelper s x) :: m | [] -> m;;
