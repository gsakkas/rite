
let padZero l1 l2 =
  let length_diff = (List.length l1) - (List.length l2) in
  if length_diff < 0
  then length_diff = ((List.length l1) - (List.length l2))
  else length_diff;;
