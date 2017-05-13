
let rec listReverse l =
  if (List.length l) > 0 then (listReverse List.tl l) @ [List.hd l] else [];;
