
let rec last l = match l with | [] -> [] | hd::tl -> (last tl) :: hd;;
