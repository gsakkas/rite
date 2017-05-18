
let rec listCompare l k =
  if ((List.hd l) = []) && ((List.hd k) = [])
  then true
  else
    if ((List.hd l) - (List.hd k)) != 0
    then false
    else listCompare (List.tl l) (List.tl k);;
