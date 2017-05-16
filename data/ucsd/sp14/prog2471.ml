
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (List.tl sumList);;
