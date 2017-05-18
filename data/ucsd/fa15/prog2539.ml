
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (([0] :: l1), l2)
    else (l1, ([0] :: l2));;

let _ = padZero [9; 9] [1; 0; 0; 2];;
