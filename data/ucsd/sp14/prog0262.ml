
let rec last l = match l with | [] -> 0 | hd::tl -> (last tl) :: hd;;
