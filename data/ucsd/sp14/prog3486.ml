
let padZero l1 l2 = failwith "to be implemented";;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else if length1 < length2 then padZero (0 :: l1) else padZero (0 :: l2);;
