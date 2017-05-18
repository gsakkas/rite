
let rec removeZero l =
  match l with
  | [] -> []
  | h::t ->
      if h = 0 then removeZero t else h :: (t List.combine ([1; 2] [3; 4]));;
