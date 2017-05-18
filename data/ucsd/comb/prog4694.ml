
let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> lengthOfList (tl, (count + 1));;
