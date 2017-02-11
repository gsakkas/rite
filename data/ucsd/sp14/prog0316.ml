
let rec reverse_list_tail theList result =
  match theList with
  | [] -> result
  | head::tail -> reverse_list_tail (head :: result);;
