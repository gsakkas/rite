
let rec last l = match l with | [] -> [] | _::tl2::tl -> last tl2;;
