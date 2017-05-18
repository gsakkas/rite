
let rec append list1 list2 =
  match list1 with | [] -> [] | h::t -> h :: (append list2);;
