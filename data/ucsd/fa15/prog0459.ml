
let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) :: x;;
